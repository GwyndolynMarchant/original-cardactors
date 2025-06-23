const jokers = [
  {
    name: "Billie's Blunder",
    text: [
      '{C:green}0 in 4{} chance to upgrade played {C:attention}High Card{}.',
      'Odds increase by {C:attention}1{} each hand,',
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
        "{C:chips}+?{} chips.",
        "Generates a Tail when ",
        "destroyed or sold"
    ],
    image_url: "img/rezzy-chippy.png",
    rarity: "Common"
  },
  {
    name: "Rhythm Rezzy",
    text: [
        "{C:mult}+?{} mult.",
        "Generates a Tail when ",
        "destroyed or sold"
    ],
    image_url: "img/rezzy-rhythm.png",
    rarity: "Common"
  },
  {
    name: "Ritzy Rezzy",
    text: [
        "Earn {C:money}+?{} at",
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
        "{X:mult,C:white}X?{} Mult",
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
  {
    name: "Graceful Rezzy",
    text: [
      'Does {C:edition,E:1}something{}',
      '{C:attention}?{} times more powerful',
      'than a {C:attention}graceful{} card.',
      "Generates a {C:attention}Tail{} when",
      "destroyed or sold",
      "Cannot be further {C:attention}graced{}."
    ],
    image_url: "img/graceful.png",
    rarity: "Rare"
  },
  {
    name: "Offworld Rezzy",
    soul: true,
    text: [
      "{C:inactive}From negative space...{}",
      "{X:chips,C:white}X?{} Chips",
      "Generates a {C:attention}Tail{} when",
      "destroyed or sold"
    ],
    back_url: "img/offworld-bg.png",
    face_url: "img/offworld-fg.png",
    rarity: "Alien"
  },
  {
    name: "Scandalous Sybil Throat",
    text: [
      '{C:attention}Capture{} any lone scored {C:attention}High Card{}',
      'Slowly transforms all other scored cards',
      'into the captured card',
    ],
    image_url: "img/sybil.png",
    rarity: "Rare"
  },
  {
    name: "Damascene",
    text: [
      "Gives {X:mult,C:white}X1.5{} Mult.",
      "Increases by {X:mult,C:white} X1.0 {} per",
      "additional {C:attention}Damascene{}.",
    ],
    image_url: "img/robomoof.png",
    rarity: "Common"
  },
  {
    name: "Torchstone",
    text: [
      "Gives {C:mult}+4{} Mult.",
      "Increases by {C:mult}+8{} per",
      "additional {C:attention}Moof{}.",
    ],
    image_url: "img/torchstone.png",
    rarity: "Common"
  },
  {
    name: "Hoarding Problem",
    text: [
     "This Joker gains {X:mult,C:white}X0.25{} Mult",
     "per scoring {C:attention}Gold{} card played.",
     "Destroys card.",
    ],
    image_url: "img/hoarding problem.png",
    rarity: "Rare"
  },
  {
    name: "Greebling",
    text: [
      "Every played {C:attention}face{} card {C:attention}permanently{}",
      "gains {C:chips}+10 Chips{} when scored"
    ],
    image_url: "img/greebling.png",
    rarity: "Uncommon"
  },
  {
    name: "Blackle Mori",
    soul: true,
    text: [
      "{C:inactive}I would rather be{}",
      "{C:inactive}on IFDB.org...{}",
      "Do not play."
    ],
    back_url: "img/blackle-bg.png",
    face_url: "img/blackle-fg.png",
    rarity: "Alien"
  },
  {
    name: "Quecey",
    soul: true,
    text: [
      "{C:mult}+n{} Mult.",
      "{C:inactive}Loves mods!{}"
    ],
    back_url: "img/qcc-bg.png",
    face_url: "img/qcc-fg.png",
    rarity: "Alien"
  },
  // {
  //   name: "",
  //   text: [
  //     ""
  //   ],
  //   image_url: "img/",
  //   rarity: "Common"
  // },
  {
    name: "More to come...",
    text: [
      "<a href='commissions.html'>Maybe you?</a>"
    ],
    image_url: "img/YCH.png",
    rarity: "Uncommon"
  },
]

const textures = [
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
  {
    name: "Showgirl Moof",
    text: [
      "Reskin of {C:joker}Showman{}",
      "{C:ATTENTION}Requires Malverk{}"
    ],
    image_url: "img/showgirl.png",
    rarity: "Common"
  },
  {
    name: "Suricrasia",
    text: [
      "Reskin of {C:PLANET}Eris{}",
      "{C:ATTENTION}Requires Malverk{}"
    ],
    image_url: "img/suricrasia.png",
    rarity: "Planet"
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

const spectrals = [
  {
    name: "Launch",
    text: [
      '{C:red,E:2}Destroy all{} jokers and',
      'cards in hand. {C:attention}Summon{}',
      'an {X:black,C:white}Alien{}'
    ],
    image_url: "img/launch.png",
    rarity: "Spectral"
  },
  {
    name: "Install",
    text: [
      '{C:attention}Infect{} one joker or',
      'card with {C:edition,E:1}Graceful{}'
    ],
    image_url: "img/install.png",
    rarity: "Spectral"
  },
  // {
  //   name: "",
  //   text: [
  //     ""
  //   ],
  //   image_url: "img/",
  //   rarity: "Spectral"
  // },
]

const vouchers = [
  {
    name: "Balinological Technical Institute",
    text: [
      "Gain an eternal {C:joker}Showman{}",
      "and {C:ATTENTION}+1 Joker slots{}"
    ],
    image_url: "img/btech.png",
    rarity: "Voucher"
  },
  {
    name: "BTI Internal Access",
    text: [
      "{C:joker}Duplicate{} jokers spawn",
      "with {C:ATTENTION}editions{}."
    ],
    image_url: "img/bverse.png",
    rarity: "Voucher"
  },
]

const core_items = [
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
      "{C:ATTENTION}Requires <a href='https://github.com/larswijn/CardSleeves'>CardSleeves</a>{}"
    ],
    image_url: "img/OCs-sleeve.png",
    rarity: "Sleeve"
  },
  {
    name: "Characters Pack",
    text: [
      "Choose {C:attention}1{} of {C:attention}4{} OCs",
      "{C:PALE_GREEN}Music by <a href='https://slime.global/@rezzish'>Rezzy!</a>{}"
    ],
    image_url: "img/OCs-booster.png",
    rarity: "Pack"
  },
]

const cols = {
  
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
  BOOSTER: "#646eb7",
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

const rarities = {
  "Common": "#009dff", 
  "Uncommon": "#4BC292",
  "Rare": "#fe5f55",
  "Legendary": "#b26cbb",
  "Alien": "#222",
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

const add_cards_to_div = (jokers, jokers_div) => {
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
    if (joker.rarity === "Sticker" || joker.rarity === "Seal") {
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
      joker_div.classList.add(joker.rarity.replaceAll(' ',''));
    }
  
    jokers_div.appendChild(joker_div);
  }
}

function fillSection(items, name) {
  let section = document.querySelector(`.${name}full`);
  if (items.length === 0) {
    section.style.display = "none"
  } else {
    let items_div = document.createElement("div");
    items_div.classList.add("cards");
    section.appendChild(items_div);
    add_cards_to_div(items, items_div);
  }
}

fillSection(jokers, "jokers");
fillSection(spectrals, "spectrals");
fillSection(textures, "textures");
fillSection(vouchers, "vouchers");
fillSection(core_items, "coreitems");