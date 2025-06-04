return {
    descriptions = {
        Edition = {
            e_ocs_graceful = {
                name = "Graceful",
                text = {
                    'Does {C:edition,E:1}something{}.',
                    'Will {C:attention}infect{} adjacent',
                    'cards after a delay.',
                    '{V:1}(#1#){}',
                },
            }
        },
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
            j_ocs_rezzy_tail = {
                name = 'Rezzy Tail',
                text = {
                    "Regenerates into a random {C:attention}Rezzy{c:attention}",
                    "with random values at end of round"
                }
            },
            j_ocs_rezzy_chips = {
                name = 'Chippy Rezzy',
                text = {
                    "{C:chips}+#1#{} chips.",
                    "Generates a {C:attention}Tail{} when",
                    "destroyed or sold"
                }
            },
            j_ocs_rezzy_mult = {
                name = 'Rhythm Rezzy',
                text = {
                    "{C:mult}+#1#{} mult.",
                    "Generates a {C:attention}Tail{} when",
                    "destroyed or sold"
                }
            },
            j_ocs_rezzy_cash = {
                name = 'Ritzy Rezzy',
                text = {
                    "Earn {C:money}+#1#{} at",
                    "end of round.",
                    "Generates a {C:attention}Tail{} when",
                    "destroyed or sold"
                }
            },
            j_ocs_rezzy_x = {
                name = 'X Rated Rezzy',
                text = {
                    "{X:mult,C:white} X#1# {} Mult",
                    "Generates a {C:attention}Tail{} when",
                    "destroyed or sold"
                }
            },
            j_ocs_rezzy_legend = {
                name = 'Rezzy of Legend',
                text = {
                    "Retrigger all played cards {C:attention}+#1#{} times.",
                    "Generates a {C:attention}Tail{} when",
                    "destroyed or sold"
                }
            },
            j_ocs_moof_dama = {
                name = "Damascene",
                text = {
                    "Gives {X:mult,C:white} X#1# {} Mult.",
                    "Increases by {X:mult,C:white} X#2# {} per",
                    "additional {C:attention}Moof{}.",
                    "(Starts at {X:mult,C:white} X#3# {} Mult.)"
                }
            },
            j_ocs_moof_torch = {
                name = "Torchstone",
                text = {
                    "Gives {C:mult}+#1#{} Mult.",
                    "Increases by {C:mult}+#2#{} per",
                    "additional {C:attention}Moof{}.",
                    "(Starts at {C:mult}+#3#{} Mult.)"
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
        Spectral = {
            c_ocs_install = {
                name = 'Install',
                text = {
                    '{C:attention}Infect{} one joker or',
                    'card with {C:edition,E:1}Graceful{}'
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
            },
            alt_tex_ocs_suricrasia = {
                name = 'Eris: Suricrasia',
                text = {'The planet Eris has been','replaced with Suricrasia','from the Ylastravenya system!'}
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
                    j_ring_master = { name = "Showgirl Moof" },
                    c_eris = {
                        name = "Suricrasia",
                        badge = "distant_planet"
                    }
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
                    "with {C:attention}editions{}. Gain",
                    "{C:attention}+1 Joker slots{}"
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
        dictionary = {
            e_ready = "Ready!";
            e_waiting = "Waiting…";
            k_distant_planet = "Distant Planet";
        },
        poker_hands = {
            ["Flush Five"] = "Fish",
        },
        labels = {
            ocs_graceful = "Graceful",
        }
    }
}
