P=.
SWIFT_LIB_DIR=LeetcodeUtil/.build/x86_64-apple-macosx/debug
SWIFT_LIB_NAME=LeetcodeUtil
SWIFT_LIB_PATH=$(SWIFT_LIB_DIR)/lib$(SWIFT_LIB_NAME).a

run-java:
	javac $(P)/Main.java
	cd $(P) && java Main

run-swift: $(SWIFT_LIB_PATH)
	swiftc -L$(SWIFT_LIB_DIR) -I$(SWIFT_LIB_DIR) -l$(SWIFT_LIB_NAME) $(P)/main.swift -o swift-answear
	./swift-answear

run-swift-pm:
	cd $(P) && swift run

$(SWIFT_LIB_PATH):
	cd LeetcodeUtil && swift build

swift-util: $(SWIFT_LIB_PATH)

test-swift-util:
	cd LeetcodeUtil && swift test	

format-swift:
	find . -name '*.swift' -exec swift-format -i {} \;

run-go:
	cd $(P) && go run main.go


clean:
	rm -rf swift-answear
	rm -rf LeetcodeUtil/.build