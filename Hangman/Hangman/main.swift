//
//  main.swift
//  hangman-project
//
//  Created by Michelle Cueva on 7/12/19.
//  Copyright © 2019 Michelle Cueva. All rights reserved.
//

import Foundation



func getInput() -> String? {
    print("Choose a letter:", terminator: " ")
    let lineIn = readLine()
    return lineIn
}

let allTheWords = ["able", "about", "account", "acid", "across", "addition", "adjustment", "advertisement", "after", "again", "against", "agreement", "almost", "among", "amount", "amusement", "angle", "angry", "animal", "answer", "apparatus", "apple", "approval", "arch", "argument", "army", "attack", "attempt", "attention", "attraction", "authority", "automatic", "awake", "baby", "back", "balance", "ball", "band", "base", "basin", "basket", "bath", "beautiful", "because", "before", "behaviour", "belief", "bell", "bent", "berry", "between", "bird", "birth", "bite", "bitter", "black", "blade", "blood", "blow", "blue", "board", "boat", "body", "boiling", "bone", "book", "boot", "bottle", "brain", "brake", "branch", "brass", "bread", "breath", "brick", "bridge", "bright", "broken", "brother", "brown", "brush", "bucket", "building", "bulb", "burn", "burst", "business", "butter", "button", "cake", "camera", "canvas", "card", "care", "carriage", "cart", "cause", "certain", "chain", "chalk", "chance", "change", "cheap", "cheese", "chemical", "chest", "chief", "chin", "church", "circle", "clean", "clear", "clock", "cloth", "cloud", "coal", "coat", "cold", "collar", "colour", "comb", "come", "comfort", "committee", "common", "company", "comparison", "competition", "complete", "complex", "condition", "connection", "conscious", "control", "cook", "copper", "copy", "cord", "cork", "cotton", "cough", "country", "cover", "crack", "credit", "crime", "cruel", "crush", "current", "curtain", "curve", "cushion", "damage", "danger", "dark", "daughter", "dead", "dear", "death", "debt", "decision", "deep", "degree", "delicate", "dependent", "design", "desire", "destruction", "detail", "development", "different", "digestion", "direction", "dirty", "discovery", "discussion", "disease", "disgust", "distance", "distribution", "division", "door", "doubt", "down", "drain", "drawer", "dress", "drink", "driving", "drop", "dust", "early", "earth", "east", "edge", "education", "effect", "elastic", "electric", "engine", "enough", "equal", "error", "even", "event", "ever", "every", "example", "exchange", "existence", "expansion", "experience", "expert", "face", "fact", "fall", "false", "family", "farm", "father", "fear", "feather", "feeble", "feeling", "female", "fertile", "fiction", "field", "fight", "finger", "fire", "first", "fish", "fixed", "flag", "flame", "flat", "flight", "floor", "flower", "fold", "food", "foolish", "foot", "force", "fork", "form", "forward", "fowl", "frame", "free", "frequent", "friend", "from", "front", "fruit", "full", "future", "garden", "general", "girl", "give", "glass", "glove", "goat", "gold", "good", "government", "grain", "grass", "great", "green", "grey", "grip", "group", "growth", "guide", "hair", "hammer", "hand", "hanging", "happy", "harbour", "hard", "harmony", "hate", "have", "head", "healthy", "hear", "hearing", "heart", "heat", "help", "high", "history", "hole", "hollow", "hook", "hope", "horn", "horse", "hospital", "hour", "house", "humour", "idea", "important", "impulse", "increase", "industry", "insect", "instrument", "insurance", "interest", "invention", "iron", "island", "jelly", "jewel", "join", "journey", "judge", "jump", "keep", "kettle", "kick", "kind", "kiss", "knee", "knife", "knot", "knowledge", "land", "language", "last", "late", "laugh", "lead", "leaf", "learning", "leather", "left", "letter", "level", "library", "lift", "light", "like", "limit", "line", "linen", "liquid", "list", "little", "living", "lock", "long", "look", "loose", "loss", "loud", "love", "machine", "make", "male", "manager", "mark", "market", "married", "mass", "match", "material", "meal", "measure", "meat", "medical", "meeting", "memory", "metal", "middle", "military", "milk", "mind", "mine", "minute", "mist", "mixed", "money", "monkey", "month", "moon", "morning", "mother", "motion", "mountain", "mouth", "move", "much", "muscle", "music", "nail", "name", "narrow", "nation", "natural", "near", "necessary", "neck", "need", "needle", "nerve", "news", "night", "noise", "normal", "north", "nose", "note", "number", "observation", "offer", "office", "only", "open", "operation", "opinion", "opposite", "orange", "order", "organization", "ornament", "other", "oven", "over", "owner", "page", "pain", "paint", "paper", "parallel", "parcel", "part", "past", "paste", "payment", "peace", "pencil", "person", "physical", "picture", "pipe", "place", "plane", "plant", "plate", "play", "please", "pleasure", "plough", "pocket", "point", "poison", "polish", "political", "poor", "porter", "position", "possible", "potato", "powder", "power", "present", "price", "print", "prison", "private", "probable", "process", "produce", "profit", "property", "prose", "protest", "public", "pull", "pump", "punishment", "purpose", "push", "quality", "question", "quick", "quiet", "quite", "rail", "rain", "range", "rate", "reaction", "reading", "ready", "reason", "receipt", "record", "regret", "regular", "relation", "religion", "representative", "request", "respect", "responsible", "rest", "reward", "rhythm", "rice", "right", "ring", "river", "road", "roll", "roof", "room", "root", "rough", "round", "rule", "safe", "sail", "salt", "same", "sand", "scale", "school", "science", "scissors", "screw", "seat", "second", "secret", "secretary", "seed", "seem", "selection", "self", "send", "sense", "separate", "serious", "servant", "shade", "shake", "shame", "sharp", "sheep", "shelf", "ship", "shirt", "shock", "shoe", "short", "shut", "side", "sign", "silk", "silver", "simple", "sister", "size", "skin", "skirt", "sleep", "slip", "slope", "slow", "small", "smash", "smell", "smile", "smoke", "smooth", "snake", "sneeze", "snow", "soap", "society", "sock", "soft", "solid", "some", "song", "sort", "sound", "soup", "south", "space", "spade", "special", "sponge", "spoon", "spring", "square", "stage", "stamp", "star", "start", "statement", "station", "steam", "steel", "stem", "step", "stick", "sticky", "stiff", "still", "stitch", "stocking", "stomach", "stone", "stop", "store", "story", "straight", "strange", "street", "stretch", "strong", "structure", "substance", "such", "sudden", "sugar", "suggestion", "summer", "support", "surprise", "sweet", "swim", "system", "table", "tail", "take", "talk", "tall", "taste", "teaching", "tendency", "test", "than", "that", "then", "theory", "there", "thick", "thin", "thing", "this", "thought", "thread", "throat", "through", "through", "thumb", "thunder", "ticket", "tight", "till", "time", "tired", "together", "tomorrow", "tongue", "tooth", "touch", "town", "trade", "train", "transport", "tray", "tree", "trick", "trouble", "trousers", "true", "turn", "twist", "umbrella", "under", "unit", "value", "verse", "very", "vessel", "view", "violent", "voice", "waiting", "walk", "wall", "warm", "wash", "waste", "watch", "water", "wave", "weather", "week", "weight", "well", "west", "wheel", "when", "where", "while", "whip", "whistle", "white", "wide", "will", "wind", "window", "wine", "wing", "winter", "wire", "wise", "with", "woman", "wood", "wool", "word", "work", "worm", "wound", "writing", "wrong", "year", "yellow", "yesterday", "young"]

func gameLoop () {
   
    var wordToGuess = allTheWords.randomElement()!
    
    var correctGuesses = 0
    var incorrectGuesses = 0
    var maxIncorrectGuesses = 6
    var holdsAllGuesses: Set <String> = []
    var isGameOver = false
    var arrayOfWordToGuess = Array(wordToGuess)
    var buildingTheWord = [String]()
    
    for _ in 0..<arrayOfWordToGuess.count {
        buildingTheWord.append("")
    }
    
    
    func buildStrFromArr(arr:[String]) {
        var newStr = ""
        for letter in arr {
            if letter == "" {
                newStr.append("_ ")
            } else {
                newStr.append(letter + " ")
            }
        }
        print(newStr)
    }
    
    func guessALetter() -> String {
        var validInput = ""
        while validInput == "" {
            let userInput = getInput()
            if let userInput = userInput {
                if userInput.count > 1 || userInput == "" || !Character(userInput).isLetter  {
                    print("Error: Not a letter")
                } else  {
                    validInput = userInput
                }
            }
        }
        return validInput.lowercased()
    }
   
    func updateBuildingTheWord(currentLetter: String) -> [String] {
        for (index,letter) in arrayOfWordToGuess.enumerated() {
            if letter == Character(currentLetter) {
                buildingTheWord[index] = currentLetter
            }
        }
        return buildingTheWord
    }
    
    func allOfHangman(){
        print(" ______")
        print(" \u{2502}    \u{2502}")
        print(" \u{2502}     \u{20DD} ")
        
        print(" \u{2502}   \u{2501}\u{2503}\u{2501}")
        
        print(" \u{2502}   \u{0283} \u{0285}")
        print("---")
    }
    
    
    func head(){
        print(" ______")
        print(" \u{2502}    \u{2502}")
        print(" \u{2502}     \u{20DD} ")
        
        print(" \u{2502}   ")
        
        print(" \u{2502}   ")
        print("---")
    }
    
    func body(){
        print(" ______")
        print(" \u{2502}    \u{2502}")
        print(" \u{2502}     \u{20DD} ")
        
        print(" \u{2502}    \u{2503}")
        
        print(" \u{2502}   ")
        print("---")
    }
    
    func bodyAndLeftArm(){
        print(" ______")
        print(" \u{2502}    \u{2502}")
        print(" \u{2502}     \u{20DD} ")
        
        print(" \u{2502}   \u{2501}\u{2503}")
        
        print(" \u{2502}   ")
        print("---")
    }
    
    func bodyAndBothArms(){
        print(" ______")
        print(" \u{2502}    \u{2502}")
        print(" \u{2502}     \u{20DD} ")
        
        print(" \u{2502}   \u{2501}\u{2503}\u{2501}")
        
        print(" \u{2502}   ")
        print("---")
    }
    
    func bodyArmsAndLeftLeg(){
        print(" ______")
        print(" \u{2502}    \u{2502}")
        print(" \u{2502}     \u{20DD} ")
        
        print(" \u{2502}   \u{2501}\u{2503}\u{2501}")
        
        print(" \u{2502}   \u{0283} ")
        print("---")
    }

    
    print(" Let's play Hangman!" )
    sleep(1)
    print("Can you guess the word?")
    sleep(1)
    buildStrFromArr(arr: buildingTheWord)
    print("")
    
    while !isGameOver {
        let guess = guessALetter()
        if !holdsAllGuesses.contains(guess) {
            if wordToGuess.contains(guess) {
                holdsAllGuesses.insert(guess)
                correctGuesses += 1
                _ = updateBuildingTheWord(currentLetter: guess)
                print("")
                buildStrFromArr(arr: buildingTheWord)
                print("")
                if (maxIncorrectGuesses - incorrectGuesses) == 1 && buildingTheWord.contains("") {
                    print(" You have \(maxIncorrectGuesses - incorrectGuesses) guess left")
                    print(" Letters Used:", holdsAllGuesses)
                    print("")
                } else  if buildingTheWord.contains("") {
                    print(" You have \(maxIncorrectGuesses - incorrectGuesses) guesses left" )
                    print(" Letters Used:", holdsAllGuesses)
                    print("")
                }
                
            } else {
                holdsAllGuesses.insert(guess)
                incorrectGuesses += 1
            
                switch incorrectGuesses {
                case 1:
                    head()
                case 2:
                    body()
                case 3:
                    bodyAndLeftArm()
                case 4:
                    bodyAndBothArms()
                case 5:
                    bodyArmsAndLeftLeg()
                default:
                    allOfHangman()
                }
                if (maxIncorrectGuesses - incorrectGuesses) == 0 {
                    print("Sorry! You ran out of guesses. ")
                } else if (maxIncorrectGuesses - incorrectGuesses) == 1{
                    print("Sorry! You have \(maxIncorrectGuesses - incorrectGuesses) guess left. Try again!")
                } else {
                    print("Sorry! You have \(maxIncorrectGuesses - incorrectGuesses) guesses left. Try again!")
                }
                print(" Letters Used:", holdsAllGuesses)
                print("")
                buildStrFromArr(arr: buildingTheWord)
                print("")
            }
        } else {
            print("That letter was already chosen. Try again!")
        }
        
        isGameOver = !buildingTheWord.contains("") || incorrectGuesses == maxIncorrectGuesses
    }

    if !buildingTheWord.contains("") {
        sleep(1)
        print("Congrats! You Won! It only took \(incorrectGuesses + correctGuesses) guesses!")
        buildStrFromArr(arr: buildingTheWord )
    } else {
        sleep(1)
        print("Better Luck Next Time!")
        sleep(1)
        print("")
        print("The word was \(wordToGuess).")
    }
    
}

var playAgain = true

while playAgain {

    gameLoop()

    print("")

    print("Do you want to play again? yes or no" )
    let giveInput = readLine()

    if giveInput == "no" {
        print("Thanks for playing!")
        playAgain = false
    }
    
    if giveInput != "no" && giveInput != "yes" {
        print("Do you want to play again? yes or no" )
        let giveInput = readLine()
        if giveInput != "no" && giveInput != "yes" {
            print("Thanks for playing!")
            playAgain = false
        }
    }
    
 
}

