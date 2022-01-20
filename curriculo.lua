Static:add_many("gui_items", {
    {
        name = "LabeledIcon",

        required_fields = {"icon", "label", "text_style"},

        setup = function (item, info)
            local casted = item:cast_dynamic_container()
            
            casted:add_item("icon",{
                type = "Image",
                size_y = 100,
                size_x = "square",
                origin = "lt",
                image = info.icon,
            })

            casted:add_item("label", {
                type = "Text",
                string = info.label,
                align_ref = "icon",
                pos = {x = "right", y = "center"},
                origin = "lc",
                text_style = info.text_style,
            })
        end
    },

    {
        name = "FilledDots",
        required_fields = {"filled_dots"},
        
        items = {
            icon_list = {
                type = "List",
                orientation = "horizontal",
                item_count = 5,
                items_base = {
                    type = "Image",
                    size_x = "square",
                    size_y = 100,
                    image = "icon_simple_bool_btn:off"
                },
            }
        },

        setup = function (item, info)
            for i = 0, info.filled_dots - 1, 1 do
                local list = item:cast_dynamic_container():get_item("icon_list"):cast_list()
                local image = list:get_item('_' .. tostring(i)):cast_dynamic_container():get_item("item"):cast_image_view()
                image:set_image_params({image = "icon_simple_bool_btn:on"})
            end
        end 
    },

    {
        name = "LabeledFilledDots",

        required_fields = {"filled_dots", "label", "text_style"},
        -- optional = {"inverted"}
        
        setup = function (item, info)
            local casted = item:cast_dynamic_container()
            
            local items_origin
            local dots_pos_x
            local label_pos_x
            if(info.inverted == true)then
                items_origin = "rc"
                dots_pos_x = "right"
                label_pos_x = "left"
            else
                items_origin = "lc"
                dots_pos_x = "left"
                label_pos_x = "right"
            end

            casted:add_item("filled_dots",{
                type = "FilledDots",
                size_y = 40,
                origin = items_origin,
                pos_x = dots_pos_x,
                filled_dots = info.filled_dots,
            })

            casted:add_item("label", {
                type = "Text",
                string = info.label,
                align_ref = "filled_dots",
                pos = {x = label_pos_x, y = "center"},
                origin = items_origin,
                text_style = info.text_style,
            })
        end
    },

    {
        name = "MultiLineText", -- Hmm interesting ... i'll try to do this dyanmically in the future

        required = {"line_count", "text_style"},

        setup = function (item, info)
            local casted = item:cast_dynamic_container()

            local list = casted:add_item("list", {
                type = "List",
                item_count = info.line_count,
                items_align_off_set = info.line_spacing,
                items_base = {
                    type = "Text",
                    text_style = info.text_style,
                    color = info.color,
                    bold = info.bold
                },
            }):cast_list()

            for i = 0, info.line_count - 1, 1 do
                local text = list:get_item('_' .. tostring(i)):cast_dynamic_container():get_item("item"):cast_text_view()
                text:set_text_params({string = info.lines[i + 1]})
            end
        end
    }
})

local curriculo_gui = {
    base_size = {  
        x = 764,
        y = 1080
    },

    items = {
        body = {
            type = "Container",
            sprited = true,
            color = "white",
            size = {x = 100, y = 100},

            items = {
                left_bar = {
                    type = "Container",
                    sprited = true,
                    color = "the_blue",
                    size = {x = 36, y = 100},
        
                    items = {
                        fotinha = {
                            type = "Image",
                            image = "e_fotinha",
                            size = {x = 80, y = "square"},
                            pos = {x = "center", y = 12},
                            origin = "cc"
                        },

                        lista = {
                            type = "List",
                            pos_x = 0,
                            align_off_set_x = 7,
                            origin = "lt",
                            size_x = 93,
                            
                            pos_y = "bottom",
                            align_ref_y = "fotinha",
                            align_off_set_y = 3,

                            item_count = 3,
                            items_align_off_set = 2.3,

                            items = {
                                _0 = {
                                    type = "List",
                                    item_count = 2,
                                    items_align_off_set = 1,
                                    
                                    items = {
                                        _0 = {
                                            type = "Text",
                                            string = "Pessoal",
                                            text_style = "curriculum_h1_5"
                                        },
                                        _1 = {
                                            type = "List",
                                            item_count = 5,
                                            items_align_off_set = 1,
                                            align_off_set_x = 4,
                                            items = {
                                                _0 = {
                                                    type = "LabeledIcon",
                                                    size_y = 2.2,
                                                    icon = "icon_location", 
                                                    label = "  Franca - SP",
                                                    text_style = "curriculum_h3"
                                                },
                                                _1 = {
                                                    type = "LabeledIcon",
                                                    size_y = 2.2,
                                                    icon = "icon_email", 
                                                    label = "  maxmfonseca12@gmail.com",
                                                    text_style = "curriculum_h3"
                                                },
                                                _2 = {
                                                    type = "LabeledIcon",
                                                    size_y = 2.2,
                                                    icon = "icon_wpp", 
                                                    label = "  (16) 98232-9710",
                                                    text_style = "curriculum_h3"
                                                },
                                                _3 = {
                                                    type = "LabeledIcon",
                                                    size_y = 2.2,
                                                    icon = "icon_linkedin", 
                                                    label = "  /max-fonseca-94823022b",
                                                    text_style = "curriculum_h3"
                                                },
                                                _4 = {
                                                    type = "LabeledIcon",
                                                    size_y = 2.2,
                                                    icon = "icon_github", 
                                                    label = "  /MaxMFonseca",
                                                    text_style = "curriculum_h3"
                                                }
                                            }
                                        }
                                    },
                                },

                                _1 = {
                                    type = "List",
                                    item_count = 2,
                                    items_align_off_set = 3,
                                    items = {
                                        _0 = {
                                            type = "Text",
                                            string = "Habilidades",
                                            text_style = "curriculum_h1_5"
                                        },
                                        _1 = {
                                            type = "List",
                                            item_count = 5,
                                            items_align_off_set = 1,
                                            align_off_set_x = 4,
                                            items = {
                                                _0 = {
                                                    type = "LabeledFilledDots",
                                                    size_y = 2.2,
                                                    filled_dots = 5,
                                                    label = "  Desenvolvimento de Software",
                                                    text_style = "curriculum_h3"
                                                },
                                                _1 = {
                                                    type = "LabeledFilledDots",
                                                    size_y = 2.2,
                                                    filled_dots = 4, 
                                                    label = "  Escrita academica",
                                                    text_style = "curriculum_h3"
                                                },
                                                _2 = {
                                                    type = "LabeledFilledDots",
                                                    size_y = 2.2,
                                                    filled_dots = 4,
                                                    label = "  Trabalho em equipe",
                                                    text_style = "curriculum_h3"
                                                },
                                                _3 = {
                                                    type = "LabeledFilledDots",
                                                    size_y = 2.2,
                                                    filled_dots = 3,
                                                    label = "  Documentacao",
                                                    text_style = "curriculum_h3"
                                                },
                                                _4 = {
                                                    type = "LabeledFilledDots",
                                                    size_y = 2.2,
                                                    filled_dots = 4,
                                                    label = "  Comunicacao",
                                                    text_style = "curriculum_h3"
                                                }
                                            }
                                        }
                                    }
                                },

                                _2 = {
                                    type = "List",
                                    item_count = 2,
                                    items_align_off_set = 1.5,
                                    items = {
                                        _0 = {
                                            type = "Text",
                                            string = "Idiomas",
                                            text_style = "curriculum_h1_5"
                                        },
                                        _1 = {
                                            type = "List",
                                            item_count = 2,
                                            items_align_off_set = 1,

                                            items = {
                                                _0 = {
                                                    type = "List",
                                                    item_count = 2,
                                                    items_align_off_set = 2,
                                                    align_off_set_x = 4,
                                                    items = {
                                                        _0 = {
                                                            type = "Text",
                                                            string = "Ingles:",
                                                            text_style = "curriculum_h2_5"
                                                        },
                                                        _1 = {
                                                            type = "List",
                                                            item_count = 3,
                                                            items_align_off_set = 0.5,

                                                            items = {
                                                                _0 = {
                                                                    type = "LabeledFilledDots",
                                                                    size_y = 2.2,
                                                                    filled_dots = 5,
                                                                    label = "  Leitura",
                                                                    text_style = "curriculum_h4"
                                                                },
                                                                _1 = {
                                                                    type = "LabeledFilledDots",
                                                                    size_y = 2.2,
                                                                    filled_dots = 4, 
                                                                    label = "  Escrita",
                                                                    text_style = "curriculum_h4"
                                                                },
                                                                _2 = {
                                                                    type = "LabeledFilledDots",
                                                                    size_y = 2.2,
                                                                    filled_dots = 5,
                                                                    label = "  Comunicacao",
                                                                    text_style = "curriculum_h4",
                                                                },
                                                            }
                                                        }
                                                    }
                                                },

                                                _1 = {
                                                    type = "List",
                                                    item_count = 2,
                                                    items_align_off_set = 1,
                                                    align_off_set_x = 4,
                                                    items = {
                                                        _0 = {
                                                            type = "Text",
                                                            string = "Linguagens de programacao:",
                                                            text_style = "curriculum_h2_5"
                                                        },
                                                        _1 = {
                                                            type = "List",
                                                            item_count = 6,
                                                            items_align_off_set = 0.5,

                                                            items = {
                                                                _0 = {
                                                                    type = "Text",
                                                                    string = "-> C/C++",
                                                                    text_style = "curriculum_h3",
                                                                    char_size = 14
                                                                },
                                                                _1 = {
                                                                    type = "Text",
                                                                    string = "-> Lua",
                                                                    text_style = "curriculum_h3",
                                                                    char_size = 14

                                                                },
                                                                _2 = {
                                                                    type = "Text",
                                                                    string = "-> Java",
                                                                    text_style = "curriculum_h3",
                                                                },
                                                                _3 = {
                                                                    type = "Text",
                                                                    string = "-> WEB (HTML/CSS/JS)",
                                                                    text_style = "curriculum_h3",
                                                                },
                                                                _4 = {
                                                                    type = "Text",
                                                                    string = "-> Dart/Kotlyn",
                                                                    text_style = "curriculum_h3",
                                                                },
                                                                _5 = {
                                                                    type = "Text",
                                                                    string = " . . . ",
                                                                    text_style = "curriculum_h2_5",
                                                                },
                                                            }
                                                        }
                                                    }
                                                },
                                            }
                                        }
                                    }
                                },
                            }
                        }
                    }
                },

                right_content = {
                    type = "Container",
                    size_x = 64,
                    size_y = 100,
                    pos_x = "right",
                    align_ref = "left_bar",

                    items = {
                        name = {
                            type = "Text",
                            string = "Max Santos",
                            text_style = "curriculum_h1",
                            color = "the_blue",
                            pos_x = "center",
                            align_off_set_y = 8,
                            origin = "ct",
                        },
                        title = {
                            type = "Text",
                            string = "Programador",
                            text_style = "curriculum_h1_5",
                            color = "the_light_blue",
                            pos = {x = "left", y = "bottom"},
                            align_ref = "name",
                            align_off_set_y = 1,
                        },

                        content = {
                            type = "List",
                            align_ref = "title",
                            pos = {x = "left", y = "bottom"},
                            origin = "lt",
                            align_off_set_y = 3,
                            items_align_off_set = 2,
                            item_count = 4,
                            
                            items = {
                                _0 = {
                                    type = "List",
                                    items_align_off_set = 1,

                                    item_count = 2,
                                    items = {
                                        _0 = {
                                            type = "Text",
                                            string = "Perfil Pessoal",
                                            text_style = "curriculum_h2",
                                            color = "the_light_blue"
                                        },
                                        _1 = {
                                            type = "MultiLineText",
                                            align_off_set_x = 2,
                                            line_count = 3,
                                            text_style = "curriculum_h3",
                                            color = "black",
                                            line_spacing = 0.5,
                                            lines = {
                                                "21 anos, formando em ciencias da computacao, impulsionado",
                                                "por desafios em programacao.",
                                                "-- ESPECIFICO --",
                                            },
                                        }
                                    }
                                },

                                _1 = {
                                    type = "List",
                                    items_align_off_set = 1,

                                    item_count = 2,
                                    items = {
                                        _0 = {
                                            type = "Text",
                                            string = "Objetivos",
                                            text_style = "curriculum_h2",
                                            color = "the_light_blue"
                                        },
                                        _1 = {
                                            type = "MultiLineText",
                                            align_off_set_x = 2,
                                            line_count = 1,
                                            text_style = "curriculum_h3",
                                            color = "black",
                                            line_spacing = 0.5,
                                            lines = {
                                                "-- ESPECIFICO --",
                                            },
                                        }
                                    }
                                },

                                _2 = {
                                    type = "List",
                                    items_align_off_set = 1,

                                    item_count = 2,
                                    items = {
                                        _0 = {
                                            type = "Text",
                                            string = "Historico academico",
                                            text_style = "curriculum_h2",
                                            color = "the_light_blue"
                                        },
                                        _1 = {
                                            type = "List",
                                            item_count = 9,
                                            items_align_off_set = .5,
                                            items = {
                                                _0 = {
                                                    type = "Text",
                                                    string = "Bacharelado em Ciencias da Computacao",
                                                    text_style = "curriculum_h2_5",
                                                    color = "dark_gray",
                                                    bold = true
                                                },
                                                _1 = {
                                                    type = "Text",
                                                    string = "Universidade Federal de Sao Carlos | 2018 - Presente",
                                                    text_style = "curriculum_h2_5",
                                                    color = "gray",
                                                    bold = false
                                                },
                                                _2 = {
                                                    type = "MultiLineText",
                                                    text_style = "curriculum_h2_5",
                                                    color = "black",
                                                    bold = false,
                                                    line_spacing = 0.5,
                                                    line_count = 3,
                                                    lines = {
                                                        "-> Previsao de formatura Junho/22",
                                                        "-> PICME/CNPq (Projeto de inicaicao cientifica e",
                                                        "    mestrado): \"Uma introducao a teoria dos grupos\"",
                                                    },
                                                },
                                                _3 = {
                                                    type = "Text",
                                                    string = "Ensino Medio",
                                                    text_style = "curriculum_h2_5",
                                                    color = "dark_gray",
                                                    bold = true
                                                },
                                                _4 = {
                                                    type = "Text",
                                                    string = "EE Vicente Minicucci | 2015 - 2017",
                                                    text_style = "curriculum_h2_5",
                                                    color = "gray",
                                                    bold = false
                                                },
                                                _5 = {
                                                    type = "MultiLineText",
                                                    text_style = "curriculum_h2_5",
                                                    color = "black",
                                                    bold = false,
                                                    line_spacing = 0.5,
                                                    line_count = 1,
                                                    lines = {
                                                        "-> 2 vezes medalhista da OBMEP (2016/2017)"
                                                    },
                                                },
                                                _6 = {
                                                    type = "Text",
                                                    string = "Ensino Fundamental",
                                                    text_style = "curriculum_h2_5",
                                                    color = "dark_gray",
                                                    bold = true
                                                },
                                                _7 = {
                                                    type = "Text",
                                                    string = "EE Vicente Minicucci | 2011 - 2014",
                                                    text_style = "curriculum_h2_5",
                                                    color = "gray",
                                                    bold = false
                                                },
                                                _8 = {
                                                    type = "MultiLineText",
                                                    text_style = "curriculum_h2_5",
                                                    color = "black",
                                                    bold = false,
                                                    line_spacing = 0.5,
                                                    line_count = 1,
                                                    lines = {
                                                        "-> 3 vezes medalhista da OBMEP (2011/2013/2014)"
                                                    },
                                                }
                                            }
                                        }
                                    }
                                },

                                _3 = {
                                    type = "List",
                                    items_align_off_set = 1,

                                    item_count = 2,
                                    items = {
                                        _0 = {
                                            type = "Text",
                                            string = "Experiencias relevantes",
                                            text_style = "curriculum_h2",
                                            color = "the_light_blue"
                                        },
                                        _1 = {
                                            type = "List",
                                            item_count = 6,
                                            items_align_off_set = .5,
                                            items = {
                                                _0 = {
                                                    type = "Text",
                                                    string = "LUAS (Projeto Pessoal)",
                                                    text_style = "curriculum_h2_5",
                                                    color = "dark_gray",
                                                    bold = true
                                                },
                                                _1 = {
                                                    type = "Text",
                                                    string = "C++/Lua/Yaml/GLSL",
                                                    text_style = "curriculum_h2_5",
                                                    color = "gray",
                                                    bold = false
                                                },
                                                _2 = {
                                                    type = "MultiLineText",
                                                    text_style = "curriculum_h2_5",
                                                    color = "black",
                                                    bold = false,
                                                    line_spacing = 0.5,
                                                    line_count = 8,
                                                    lines = {
                                                        "-> Desenvolvendo um framework para criacao",
                                                        "    de aplicacoes 2D em geral.",
                                                        "-> O projeto esta em estagios intermediarios.",
                                                        "-> Esse documento foi inteiro escrito usando LUAS!!",
                                                        "-> Codigo deste documento pode ser visto em: ",
                                                        "",
                                                        "-> LUAS esta em um repositorio privado, mas ficaria feliz",
                                                        "    em mostrar o que aprendi fazendo-o em entrevista."
                                                    },
                                                },
                                                _3 = {
                                                    type = "Text",
                                                    string = "Projetos da graduacao",
                                                    text_style = "curriculum_h2_5",
                                                    color = "dark_gray",
                                                    bold = true
                                                },
                                                _4 = {
                                                    type = "Text",
                                                    string = "Python/Java/JS/TS/Dart/Kotlin/HTML/CSS/Lisp ...",
                                                    text_style = "curriculum_h2_5",
                                                    color = "gray",
                                                    bold = false
                                                },
                                                _5 = {
                                                    type = "MultiLineText",
                                                    text_style = "curriculum_h2_5",
                                                    color = "black",
                                                    bold = false,
                                                    line_spacing = 0.5,
                                                    line_count = 2,
                                                    lines = {
                                                        "-> Varios dos projetos desenvolvidos durante a graduacao",
                                                        "    podem serem vistos em meu repositorio no GitHub.",
                                                    },
                                                },
                                            }
                                        }
                                    }
                                },
                            }
                        }
                    }
                }
            }
        }
    }
}


Static:add("room_definitions", {
    name = "curriculo",

    setup = function ()
        return { gui = curriculo_gui }
    end
})