package main

import (
	"encoding/json"
	"log"
	"os"
)

func runTest(methodFilePath string, argFilePath string, outputFilePath string) {
	methods := readMethods(methodFilePath)
	args := readArg(argFilePath)
	output := readOutput(outputFilePath)

	s := Constructor()
	for i, method := range methods {
		switch method {
		case "SmallestInfiniteSet":
			s = Constructor()
		case "popSmallest":
			result := s.PopSmallest()
			if result != output[i] {
				log.Fatalf("Expected %v but got %v", output[i], result)
			}
		case "addBack":
			s.AddBack(args[i])
		}
	}
}

func readMethods(methodFilePath string) []string {
	file, err := os.Open(methodFilePath)
	if err != nil {
		log.Fatalf("Failed to open file: %v", err)
	}
	defer file.Close()

	fileContent, err := os.ReadFile(methodFilePath)
	if err != nil {
		log.Fatalf("Failed to read file: %v", err)
	}

	var methods []string
	err = json.Unmarshal(fileContent, &methods)
	if err != nil {
		log.Fatalf("Failed to unmarshal JSON: %v", err)
	}
	return methods
}

func readArg(argFilePath string) []int {
	fileContent, err := os.ReadFile(argFilePath)
	if err != nil {
		log.Fatalf("Failed to read file: %v", err)
	}
	var parsedData [][]int
	err = json.Unmarshal(fileContent, &parsedData)
	if err != nil {
		log.Fatalf("Failed to unmarshal JSON: %v", err)
	}

	var result []int
	for _, item := range parsedData {
		if len(item) == 0 {
			result = append(result, 0)
		} else {
			result = append(result, item[0])
		}
	}

	return result
}

func readOutput(methodFilePath string) []int {
	file, err := os.Open(methodFilePath)
	if err != nil {
		log.Fatalf("Failed to open file: %v", err)
	}
	defer file.Close()

	fileContent, err := os.ReadFile(methodFilePath)
	if err != nil {
		log.Fatalf("Failed to read file: %v", err)
	}

	var methods []int
	err = json.Unmarshal(fileContent, &methods)
	if err != nil {
		log.Fatalf("Failed to unmarshal JSON: %v", err)
	}
	return methods
}
