init:
	bundle install

install:
	go install -mod=vendor .

vendor:
	go mod vendor

build:
	GOOS=darwin GOARCH=arm64 go build -o protoc-gen-rbi-darwin-arm64
	GOOS=linux GOARCH=amd64 go build -o protoc-gen-rbi-linux-amd64

test: init install
	$(eval PROTOS := $(shell cd testdata && find . -name "*.proto" | sed 's|^./||'))
	$(eval GRPC_TOOLS_LOCATION := $(shell bundle show grpc-tools))
	$(eval PROTOC_BINARY := $(GRPC_TOOLS_LOCATION)/bin/grpc_tools_ruby_protoc)
	$(eval GRPC_PLUGIN := $(GRPC_TOOLS_LOCATION)/bin/grpc_tools_ruby_protoc_plugin)
	$(PROTOC_BINARY) --proto_path=testdata --ruby_out=testdata $(PROTOS)
	$(PROTOC_BINARY) --proto_path=testdata --ruby_grpc_out=testdata --plugin=protoc-gen-ruby_grpc=$(GRPC_PLUGIN) $(PROTOS)
	$(PROTOC_BINARY) --proto_path=testdata --rbi_out=grpc=true:testdata $(PROTOS)
	git diff --exit-code testdata
