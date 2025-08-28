# ----- Basics -----
SHELL := /usr/bin/env bash
.DEFAULT_GOAL := help

# Project
APP        ?= cafe-arch-lab
CMD        ?= ./cmd/app
PKG        ?= ./...
BIN        ?= bin/$(APP)

# Versioning
VERSION    := $(shell git describe --tags --always --dirty=-dev 2>/dev/null || echo dev)
COMMIT     := $(shell git rev-parse --short HEAD 2>/dev/null || echo none)
DATE       := $(shell date -u +'%Y-%m-%dT%H:%M:%SZ')

LDFLAGS    := -s -w \
	-X 'main.version=$(VERSION)' \
	-X 'main.commit=$(COMMIT)' \
	-X 'main.date=$(DATE)'

# Tools
GO                ?= go
GOLANGCI_LINT     ?= golangci-lint
MIGRATE           ?= migrate
AIR               ?= air
DOCKER            ?= docker
COMPOSE           ?= docker compose

# Test/Cover
COVERPROFILE      ?= coverage.out
TEST_FLAGS        ?= -race -covermode=atomic -coverprofile=$(COVERPROFILE)

# Load .env if present
ifneq (,$(wildcard .env))
include .env
export
endif

# ----- Phony -----
.PHONY: help run

# ----- Help -----
help: ## Show help (this)
	@awk -F ':.*##' '/^[a-zA-Z0-9_.-]+:.*##/ {printf "\033[36m%-20s\033[0m %s\n", $$1, $$2}' $(MAKEFILE_LIST)

# ----- Go workflow -----
run: ## server run
	air -c .air.toml
