return {
    descriptions = {
        Joker = {
            j_ocs_billiesblunder = {
                name = 'Billie\'s Blunder',
                text = {
                    '{C:green}#1# in #2#{} chance to upgrade played {C:attention}High Card{}',
                    'Odds increase by {C:attention}#3#{} each hand,',
                    'and reset at success or end of round.'
                }
            },
            j_ocs_geniusjunebug = {
                name = 'June, Balatro Genius',
                text = {
                    "Gives {X:mult,C:white} X#1# {} Mult.",
                    "Increased by {X:mult,C:white} X#2# {} for the",
                    "highest stake June has defeated."
                }
            },
            j_ocs_rezzytail = {
                name = 'Rezzy Tail',
                text = {
                    "Regenerates into a random {C:attention}Rezzy{c:attention}",
                    "with random values at end of round"
                }
            },
            j_ocs_rezzychips = {
                name = 'Chippy Rezzy',
                text = {
                    "{C:chips}+#1#{} chips.",
                    "Generates a {C:attention}Tail{} when",
                    "destroyed or sold"
                }
            },
            j_ocs_rezzymult = {
                name = 'Rhythm Rezzy',
                text = {
                    "{C:mult}+#1#{} mult.",
                    "Generates a {C:attention}Tail{} when",
                    "destroyed or sold"
                }
            },
            j_ocs_rezzycash = {
                name = 'Ritzy Rezzy',
                text = {
                    "Earn {C:money}+#1#{} at",
                    "end of round.",
                    "Generates a {C:attention}Tail{} when",
                    "destroyed or sold"
                }
            },
            j_ocs_rezzyx = {
                name = 'X Rated Rezzy',
                text = {
                    "{X:mult,C:white} X#1# {} Mult",
                    "Generates a {C:attention}Tail{} when",
                    "destroyed or sold"
                }
            },
            j_ocs_rezzylegend = {
                name = 'Rezzy of Legend',
                text = {
                    "Retrigger all played cards {C:attention}+#1#{} times.",
                    "Generates a {C:attention}Tail{} when",
                    "destroyed or sold"
                }
            },
            j_ocs_robomoof = {
                name = "Damascene",
                text = {
                    "Gives {X:mult,C:white} X#1# {} Mult.",
                    "Increases by {X:mult,C:white} X#2# {} per",
                    "additional {C:attention}Damascene{}.",
                    "(Starts at {X:mult,C:white} X#3# {} Mult.)"
                }
            },
            j_ocs_sybilthroat = {
                  name = 'Scandalous Sybil Throat',
                  text = {
                    '{C:attention}Capture{} any lone scored {C:attention}High Card{}',
                    'Slowly transforms all other scored cards',
                    'into the captured card',
                    '{V:1}(#1#){}',
                  }
            }
        },
        alt_texture = {
            alt_tex_ocs_vampire_bat = {
                name = 'Vampire: Vampire Batgirl',
                text = {'The vampire is changed','into an anthro batgirl!'},
            },
            alt_tex_ocs_billie_fist = {
                name = 'Raised Fist: Rebel Against Judgement',
                text = {'The raised fist now','belongs to Billie Hellgnoll!'},
            },
            alt_tex_ocs_todo_hyena = {
                name = 'Todo List: HYENA',
                text = {'The to-do list','spells out HYENA now'},
            },
            alt_tex_ocs_smol_blind = {
                name = 'Small Blind: Smol Blind',
                text = {'The blind is smol… uwu'}
            },
            alt_tex_ocs_showgirl = {
                name = 'Showman: Showgirl Moof',
                text = {'The showman is now','a delightful showgirl','wolf-cow!'}
            }
        },
        texture_packs = {
            texpack_ocs_OCs = {
                name = 'Original Cardactors',
                text = {
                    'Replacement art',
                    'by Hellgnoll'
                },
                localization = {
                    j_vampire = { name = "Vampire Batgirl" },
                    j_raised_fist = { name = "Rebel Against Judgement" },
                    b_small = { name = "Smol Blind" },
                    j_ring_master = { name = "Showgirl Moof" }
                }
            }
        },
        Sleeve = {
            sleeve_ocs_sleeve_oc = {
                name = "DO NOT STEAL",
                text = { "Start with one","OC joker." }
            },
            sleeve_ocs_sleeve_oc_alt = {
                name = "DO NOT STEAL",
                text = {
                    "Start with an additional OC joker",
                    "plus one retextured joker"
                }
            }
        },
        Voucher = {
            v_ocs_btech = {
                name = "Balinological Technical Institute",
                text = {
                  "Gain an eternal {C:attention}#1#{}",
                  "and {C:attention}+1 Joker slots{}"
                }
            },
            v_ocs_bverse = {
                name = "BTI Internal Access",
                text = {
                    "{C:attention}Duplicate{} jokers spawn",
                    "with {C:attention}editions{}."
                }
            }
        }
    },
    misc = {
        achievement_names = {
            ach_ocs_hyena = "HYENA",
        },
        achievement_descriptions = {
            ach_ocs_hyena = "Get all HYENA jokers (Hint: Malverk!)"
        },
    }
}
