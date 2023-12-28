P=.
SWIFT_LIB_DIR=swift-util/.build/x86_64-apple-macosx/debug
SWIFT_LIB_NAME=LeetcodeUtil
SWIFT_LIB_PATH=$(SWIFT_LIB_DIR)/lib$(SWIFT_LIB_NAME).a

run-java:
	javac $(P)/Main.java
	cd $(P) && java Main

run-swift: $(SWIFT_LIB_PATH)
	swiftc -L$(SWIFT_LIB_DIR) -I$(SWIFT_LIB_DIR) -l$(SWIFT_LIB_NAME) $(P)/main.swift -o swift-answear
	./swift-answear

$(SWIFT_LIB_PATH):
	cd swift-util && swift build

swift-util: $(SWIFT_LIB_PATH)

test-swift-util:
	cd swift-util && swift test	

format-swift:
	find . -name '*.swift' -exec swift-format -i {} \;

clean:
	rm -rf swift-answear
	rm -rf swift-util/.build