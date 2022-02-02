SHELL=/bin/bash

REPOSITORY=github.com/ravblk
PROJECT=$(REPOSITORY)/$(app)
APP_NAME_DEFAULT=<app-name>
REPOSITORY_DEFAULT=<rep>
rep=REPOSITORY

project:
	mkdir -p $(app)
	cd $(app) && go mod init $(PROJECT)

	go get -u github.com/spf13/cobra/cobra
	cd $(app) &&\
	cobra init --pkg-name $(PROJECT) &&\
	cobra add serve &&\
	mkdir -p cmd/$(app) &&\
	mv main.go cmd/$(app) 
	
	cp -r src/build $(app)
	cp src/.golangci.yml $(app)
	cp src/.gitignore $(app)
	cp src/Makefile $(app)
	cp src/README.md $(app)

	mkdir -p $(app)/pkg
	cp -r src/pkg/domain $(app)/pkg
	cp -r src/pkg/mock $(app)/pkg
	cp -r src/pkg/config $(app)/pkg

	mkdir -p $(app)/proto/$(app)/v1
	mkdir -p $(app)/configs
	echo "debug: true" > $(app)/configs/$(app).yaml

	find $(app)/ -type f -exec sed -i '.bak' 's!$(APP_NAME_DEFAULT)!$(app)!g' {} \;
	find $(app)/ -type f -name '*.bak' -exec rm {} \;

	find $(app)/ -type f -exec sed -i '.bak' 's!$(REPOSITORY_DEFAULT)!$(rep)!g' {} \;
	find $(app)/ -type f -name '*.bak' -exec rm {} \;