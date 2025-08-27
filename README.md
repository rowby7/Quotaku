# Quotaku - Rowby Villanueva

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

## 🚀 Live Demo

https://github.com/user-attachments/assets/773c5c76-7e05-4e8e-9601-0e82c76d2302

## 💡 Problem Statement

### The Quote Discovery Gap: 
While fans remember powerful moments and inspiring dialogue from their favorite shows, finding and sharing specific quotes when you want them can be frustrating. That perfect quote for motivation or to share with friends often gets lost in memory.

### Recommendation Overload: 
Friends, online communities, and social media constantly generate anime recommendations, but keeping track of "must-watch" series becomes overwhelming. Great suggestions get forgotten in the endless scroll of content.

### Fragmented Anime Management: 
Fans currently juggle multiple platforms, notes apps, and mental lists to track what they want to watch, what they're currently watching, and what they've completed, leading to a disorganized viewing experience.


## ✨ Solution
Our anime app addresses these pain points by providing:

### Instant Quote Search: 
Discover memorable quotes from any anime series at your fingertips

### Personal Anime Vault: 
Save and organize anime synopses for future viewing in your personalized watchlist

### Streamlined Discovery: 
Transform scattered recommendations into an organized, accessible collection

By combining quote discovery with watchlist management, we're creating the ultimate companion app for anime fans who want to celebrate the medium's most inspiring moments while never losing track of their next great series to explore.

### App Evaluation

- **Category:** Entertainment
- **Mobile:** Designed for quick, on-the-go inspiration
- **Story:** Appeals to anime fans by connecting them with emotional and philosophical depth of their favorite shows
- **Market:** Targets anime enthusiasts 
- **Habit:**
- **Scope:**

## 🎨 Features

### Current Features (MVP - Weeks 1-5)
- [x] Quote Search based on Anime
- [x] Favorite an Anime
- [x] Favorites tab view
- [x] Grouped Favorites Names

### Planned Features (Weeks 6-10)
- [ ] Pick between quote search and synopses search
- [ ] Anime synopses search
- [ ] Synopses Favorites button/saving
- [ ] Finished/Started watching button

## 🛠️ Technical Stack
### Frontend
- ##Swift##



## Product Spec

* User can view a random anime quote on app launch
* User can search for quotes by anime title
* User can save favorite quotes locally
* User can view a list of saved quotes
* User can refresh to get a new random quote





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
