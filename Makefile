P=.

run-java:
	javac $(P)/Main.java
	cd $(P) && java Main

run-swift:
	swift $(P)/main.swift
format-swift:
	find . -name '*.swift' -exec swift-format -i {} \;