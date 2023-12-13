P=.

run-java:
	javac $(P)/Main.java
	cd $(P) && java Main

run-swift:
	swiftc swift-util/util.swift $(P)/main.swift -o swift-answear
	./swift-answear

format-swift:
	find . -name '*.swift' -exec swift-format -i {} \;