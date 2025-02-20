let jokers = [
  {
    name: "Billie's Blunder",
    text: [
      '{C:green}0 in 4{} chance to upgrade {C:attention}High Card{}',
      'before played. Odds increase by {C:attention}1{} each hand,',
      'and reset at success or end of round.'
    ],
    image_url: "img/billie-blunder.png",
    rarity: "Uncommon"
  },
  {
    name: "June, Balatro Genius",
    text: [
      "Gives {X:mult,C:white}X1{} Mult.",
      "Increased by {X:mult,C:white}X0.25{} for the",
      'highest stake June has defeated.'
    ],
    image_url: "img/junebug.png",
    rarity: "Uncommon"
  },
  {
    name: "Rezzy Tail",
    text: [
        "Regenerates into a random Rezzy",
        "with random values at end of round"
    ],
    image_url: "img/rezzy-tail.png",
    rarity: "Common"
  },
  {
    name: "Chippy Rezzy",
    text: [
        "{C:chips}+1?{} chips.",
        "Generates a Tail when ",
        "destroyed or sold"
    ],
    image_url: "img/rezzy-chippy.png",
    rarity: "Common"
  },
  {
    name: "Rhythm Rezzy",
    text: [
        "{C:mult}+1?{} mult.",
        "Generates a Tail when ",
        "destroyed or sold"
    ],
    image_url: "img/rezzy-rhythm.png",
    rarity: "Common"
  },
  {
    name: "Ritzy Rezzy",
    text: [
        "Earn {C:money}+1?{} at",
        "end of round.",
        "Generates a Tail when ",
        'destroyed or sold'
    ],
    image_url: "img/rezzy-ritzy.png",
    rarity: "Uncommon"
  },
  {
    name: "X Rated Rezzy",
    text: [
        "{X:mult,C:white}X1?{} Mult",
        "Generates a Tail when ",
        'destroyed or sold'
    ],
    image_url: "img/rezzy-x.png",
    rarity: "Rare"
  },
  {
    name: "Rezzy of Legend",
    soul: true,
    text: [
        "Retrigger all played cards {C:chips}+1?{} times.",
        "Generates a Tail when ",
        'destroyed or sold'
    ],
    back_url: "img/rezzy-legend-back.png",
    face_url: "img/rezzy-legend-front.png",
    rarity: "Legendary"
  },
  // {
  //   name: "",
  //   text: [
  //     ""
  //   ],
  //   image_url: "img/",
  //   rarity: "Common"
  // },
]

let textures = [
  {
    name: "Rebel Against Judgement",
    text: [
      "Reskin of {C:joker}Raised Fist{}",
      "{C:ATTENTION}Requires Malverk{}"
    ],
    image_url: "img/billie-fist.png",
    rarity: "Common"
  },
  {
    name: "To-do List",
    text: [
      "Reskin of {C:joker}To-do List{}",
      "{C:ATTENTION}Requires Malverk{}"
    ],
    image_url: "img/todo-hyena.png",
    rarity: "Common"
  },
  {
    name: "Vampire Batgirl",
    text: [
      "Reskin of {C:joker}Vampire{}",
      "{C:ATTENTION}Requires Malverk{}"
    ],
    image_url: "img/vampire.png",
    rarity: "Uncommon"
  },
  {
    name: "Smol Blind",
    text: [
      "Reskin of {C:joker}Small Blind{}",
      "{C:ATTENTION}Requires Malverk{}"
    ],
    image_url: "img/blind_smol.png",
    rarity: "Boss Blind"
  },
  // {
  //   name: "",
  //   text: [
  //     ""
  //   ],
  //   image_url: "img/",
  //   rarity: "Common"
  // },
]


let consumables = [

]

let card_modifications = [

]

let decks = [

]

let stickers = [

]

let blinds = [

]

let shop_items = [
  {
    name: "Original Cardactors",
    text: [
      "Begin with","an OC joker."
    ],
    image_url: "img/OCs-deck.png",
    rarity: "Deck"
  },
  {
    name: "Original Cardactors",
    text: [
      "Begin with an OC joker.",
      "{C:ATTENTION}Requires CardSleeves{}"
    ],
    image_url: "img/OCs-sleeve.png",
    rarity: "Sleeve"
  },
  {
    name: "Characters Pack",
    text: [
      "Choose {C:attention}1{} of {C:attention}4{} OCs",
    ],
    image_url: "img/OCs-booster.png",
    rarity: "Pack"
  },
]

let cols = {
  
  MULT: "#FE5F55",
  CHIPS: "#009dff",
  MONEY: "#f3b958",
  XMULT: "#FE5F55",
  FILTER: "#ff9a00",
  ATTENTION: "#ff9a00",
  BLUE: "#009dff",
  RED: "#FE5F55",
  GREEN: "#4BC292",
  PALE_GREEN: "#56a887",
  ORANGE: "#fda200",
  IMPORTANT: "#ff9a00",
  GOLD: "#eac058",
  YELLOW: "#ffff00",
  CLEAR: "#00000000", 
  WHITE: "#ffffff",
  PURPLE: "#8867a5",
  BLACK: "#374244",
  L_BLACK: "#4f6367",
  GREY: "#5f7377",
  CHANCE: "#4BC292",
  JOKER_GREY: "#bfc7d5",
  VOUCHER: "#cb724c",
  BOOSTER: "#646eb7",
  EDITION: "#ffffff",
  DARK_EDITION: "#5d5dff",
  ETERNAL: "#c75985",
  INACTIVE: "#ffffff99",
  HEARTS: "#f03464",
  DIAMONDS: "#f06b3f",
  SPADES: "#403995",
  CLUBS: "#235955",
  ENHANCED: "#8389DD",
  JOKER: "#708b91",
  TAROT: "#a782d1",
  PLANET: "#13afce",
  SPECTRAL: "#4584fa",
  VOUCHER: "#fd682b",
  EDITION: "#4ca893",
}

let rarities = {
  "Common": "#009dff", 
  "Uncommon": "#4BC292",
  "Rare": "#fe5f55",
  "Legendary": "#b26cbb",
  "Joker": "#708b91",
  "Tarot": "#a782d1",
  "Planet": "#13afce",
  "Spectral": "#4584fa",
  "Voucher": "#fd682b",
  "Pack": "#9bb6bd",
  "Enhancement": "#8389DD",
  "Edition": "#4ca893",
  "Seal": "#4584fa",
  "Deck": "#9bb6bd",
  "Sleeve": "#0047AA",
  "Sticker": "#5d5dff",
  "Boss Blind": "#5d5dff",
  "Showdown": "#4584fa",
}

regex = /{([^}]+)}/g;

let add_cards_to_div = (jokers, jokers_div) => {
  for (let joker of jokers) {
    console.log("adding joker", joker.name);
  
    joker.text = joker.text.map((line) => { return line + "{}"});
  
    joker.text = joker.text.join("<br/>");
    joker.text = joker.text.replaceAll("{}", "</span>");
    joker.text = joker.text.replace(regex, function replacer(match, p1, offset, string, groups) {
      let classes = p1.split(",");
  
      let css_styling = "";
  
      for (let i = 0; i < classes.length; i++) {
        let parts = classes[i].split(":");
        if (parts[0] === "C") {
          css_styling += `color: ${cols[parts[1].toUpperCase()]};`;
        } else if (parts[0] === "X") {
          css_styling += `background-color: ${cols[parts[1].toUpperCase()]}; border-radius: 5px; padding: 0 5px;`;
        }
      }
  
      return `</span><span style='${css_styling}'>`;
    });
  
    let joker_div = document.createElement("div");
    joker_div.classList.add("joker");
    if (joker.rarity === "Sticker" || joker.rarity == "Seal") {
      joker_div.innerHTML = `
        <h3>${joker.name}</h3>
        <img src="${joker.image_url}" alt="${joker.name}" class="hasback" />
        <h4 class="rarity ${joker.rarity}" style="background-color: ${rarities[joker.rarity]}">${joker.rarity}</h4>
        <div class="text">${joker.text}</div>
      `;
    } else if (joker.soul) {
      joker_div.innerHTML = `
        <h3>${joker.name}</h3>
        <span class="soulholder">
          <img src="${joker.back_url}" alt="${joker.name}" class="soul-bg" />
          <img src="${joker.face_url}" alt="${joker.name}" class="soul-top" />
        </span>
        <h4 class="rarity" style="background-color: ${rarities[joker.rarity]}">${joker.rarity}</h4>
        <div class="text">${joker.text}</div>
      `;
    } else {
      joker_div.innerHTML = `
        <h3>${joker.name}</h3>
        <img src="${joker.image_url}" alt="${joker.name}" />
        <h4 class="rarity" style="background-color: ${rarities[joker.rarity]}">${joker.rarity}</h4>
        <div class="text">${joker.text}</div>
      `;
    }
  
    jokers_div.appendChild(joker_div);
  }
}

if (jokers.length === 0) {
  document.querySelector(".jokersfull").style.display = "none"
} else {
  let jokers_div = document.querySelector(".jokers");
  add_cards_to_div(jokers, jokers_div);
}

if (consumables.length === 0) {
  document.querySelector(".consumablesfull").style.display = "none"
} else {
  let consumables_div = document.querySelector(".consumables");
  add_cards_to_div(consumables, consumables_div);
}

if (card_modifications.length === 0) {
  document.querySelector(".cardmodsfull").style.display = "none"
} else {
  let cardmods_div = document.querySelector(".cardmods");
  add_cards_to_div(card_modifications, cardmods_div);
}

if (decks.length === 0) {
  document.querySelector(".decksfull").style.display = "none"
} else {
  let decks_div = document.querySelector(".decks");
  add_cards_to_div(decks, decks_div);
}

if (stickers.length === 0) {
  document.querySelector(".stickersfull").style.display = "none"
} else {
  let stickers_div = document.querySelector(".stickers");
  add_cards_to_div(stickers, stickers_div);
}

if (blinds.length === 0) {
  document.querySelector(".blindsfull").style.display = "none"
} else {
  let blinds_div = document.querySelector(".blinds");
  add_cards_to_div(blinds, blinds_div);
}

if (shop_items.length === 0) {
  document.querySelector(".shopitemsfull").style.display = "none"
} else {
  let shopitems_div = document.querySelector(".shopitems");
  add_cards_to_div(shop_items, shopitems_div);
}

if (textures.length === 0) {
  document.querySelector(".texturedfull").style.display = "none"
} else {
  let textures_div = document.querySelector(".textured");
  add_cards_to_div(textures, textures_div);
}