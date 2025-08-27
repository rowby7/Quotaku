# Quotaku

## Table of Contents

1. [Overview](#Overview)
2. [Product Spec](#Product-Spec)
3. [Wireframes](#Wireframes)
4. [Schema](#Schema)

## Overview

### Description

Quotaku is a lightweight mobile app that delivers iconic anime quotes straight to your fingertips. 
Whether you're seeking inspiration, nostalgia, or just a good laugh, Quotaku fetches memorable lines from your favorite anime characters using the Animechan API. 
Users can browse random quotes, search by character or title, and save their favorites to revisit anytime.

### App Evaluation

[Evaluation of your app across the following attributes]
- **Category:** Entertainment
- **Mobile:** Designed for quick, on-the-go inspiration
- **Story:** Appeals to anime fans by connecting them with emotional and philosophical depth of their favorite shows
- **Market:** Targets anime enthusiasts 
- **Habit:**
- **Scope:**

## Product Spec

### 1. User Stories (Required and Optional)

**Required Must-have Stories**

* User can view a random anime quote on app launch
* User can search for quotes by anime title
* User can save favorite quotes locally
* User can view a list of saved quotes
* User can refresh to get a new random quote

**Optional Nice-to-have Stories**

* [fill in your required user stories here]
* ...

### 2. Screen Archetypes

- [x] Home Screen(Quote Discovery)
* 3–5 featured anime cells displayed below the search bar
  * Each cell shows the anime title and a random quote pulled from that anime
- [x] Quote Detail Screen
* Centered quote display showing the full anime quote in large, readable text
* Anime title and character name shown below the quote

### 3. Navigation

**Tab Navigation** (Tab to Screen)

* Home Tab
* Search Tab
* Favorites Tab

**Flow Navigation** (Screen to Screen)

- [x] [Search Screen]
* After pressing search it will lead to the quote screen
* Picker in the bottom between search and favorites
- [x] [Quote View Screen]
* back button to the search screen

- [] [Favorites Tab]
* Get here from the home search screen where favorites tab is in the bottom


## Wireframes
<img width="897" height="1143" alt="figma_wireframe" src="https://github.com/user-attachments/assets/cf5a47da-83f9-4f7e-8f4b-5947d548b872" />



### [BONUS] Digital Wireframes & Mockups

### [BONUS] Interactive Prototype


https://github.com/user-attachments/assets/773c5c76-7e05-4e8e-9601-0e82c76d2302


## Schema 

[This section will be completed in Unit 9]

### Models

### 🧬 Models

| Model Name       | Properties                                                                 | Description                                                  |
|------------------|-----------------------------------------------------------------------------|--------------------------------------------------------------|
| `Quote`          | `anime: String`<br>`character: String`<br>`quote: String`                   | Represents a single anime quote fetched from the Animechan API |
| `FavoriteQuote`  | `id: UUID`<br>`anime: String`<br>`character: String`<br>`quote: String`<br>`dateSaved: Date` | Locally stored quote marked as a favorite by the user        |
| `SearchResult` *(optional)* | `quotes: [Quote]`                                                  | Represents a list of quotes returned from a search query     |



### Networking

- Home Screen
  * Fetch a random anime quote on search
- Quote Detail Screen
   * Display selected quote details (already fetched)
- Favorites Screen
  * No network request (quotes are stored locally)


 
- let url = URL(string: "https://animechan.vercel.app/api/random")!
URLSession.shared.dataTask(with: url) { data, response, error in
    // Parse JSON and update UI
}.resume()

- let animeTitle = "Naruto"
let url = URL(string: "https://animechan.vercel.app/api/quotes/anime?title=\(animeTitle)")!
URLSession.shared.dataTask(with: url) { data, response, error in
    // Parse JSON and display quotes
}.resume()



<img width="468" height="646" alt="image" src="https://github.com/user-attachments/assets/9a6a9a7b-f12f-42e0-b097-95bcc61a2c1d" />
