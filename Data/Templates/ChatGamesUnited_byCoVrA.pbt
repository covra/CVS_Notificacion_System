Assets {
  Id: 5461718899091085741
  Name: "ChatGamesUnited_byCoVrA"
  PlatformAssetType: 5
  TemplateAsset {
    ObjectBlock {
      RootId: 17128609818188542397
      Objects {
        Id: 17128609818188542397
        Name: "ChatGamesUnited_byCoVrA"
        Transform {
          Scale {
            X: 1
            Y: 1
            Z: 1
          }
        }
        ParentId: 4781671109827199097
        ChildIds: 85309066085185816
        ChildIds: 2019243174432110835
        ChildIds: 7783089060453993173
        UnregisteredParameters {
          Overrides {
            Name: "cs:debugPrint"
            Bool: true
          }
          Overrides {
            Name: "cs:onlyWhenRoundEnds"
            Bool: true
          }
          Overrides {
            Name: "cs:activateByEvent"
            Bool: false
          }
          Overrides {
            Name: "cs:eventName"
            String: "testServerEnable"
          }
          Overrides {
            Name: "cs:useChatTitles"
            Bool: false
          }
          Overrides {
            Name: "cs:savePlayerData"
            Bool: true
          }
          Overrides {
            Name: "cs:customResourceName"
            String: "wordies"
          }
          Overrides {
            Name: "cs:numResWhenJoin"
            Int: 5
          }
          Overrides {
            Name: "cs:loadSapiensPills"
            Bool: true
          }
          Overrides {
            Name: "cs:loadTrivia"
            Bool: true
          }
          Overrides {
            Name: "cs:loadWheelOfFortune"
            Bool: true
          }
          Overrides {
            Name: "cs:loadHangmanGame"
            Bool: true
          }
          Overrides {
            Name: "cs:loadBattleship"
            Bool: true
          }
          Overrides {
            Name: "cs:timeToVote"
            Float: 25
          }
          Overrides {
            Name: "cs:isGameVoted"
            Bool: true
          }
          Overrides {
            Name: "cs:notDisturb"
            Bool: true
          }
          Overrides {
            Name: "cs:staticsTimeServer"
            Bool: true
          }
          Overrides {
            Name: "cs:battleShip_HitPoints"
            Int: 1
          }
          Overrides {
            Name: "cs:battleShip_SinkPoints"
            Int: 20
          }
          Overrides {
            Name: "cs:battleShip_ratioWinner"
            Int: 3
          }
          Overrides {
            Name: "cs:battleShip_roundTime"
            Float: 5
          }
          Overrides {
            Name: "cs:battleShip_setTime"
            Float: 90
          }
          Overrides {
            Name: "cs:battleShip_numMaxRounds"
            Float: 5
          }
          Overrides {
            Name: "cs:wheel_maxRounds"
            Int: 5
          }
          Overrides {
            Name: "cs:wheel_roundTime"
            Float: 10
          }
          Overrides {
            Name: "cs:hang_timeGame"
            Float: 60
          }
          Overrides {
            Name: "cs:hang_prize"
            Int: 75
          }
          Overrides {
            Name: "cs:trivia_timeGame"
            Float: 45
          }
          Overrides {
            Name: "cs:trivia_prizeM"
            Int: 5
          }
          Overrides {
            Name: "cs:CGU_GAME_HANGMAN"
            AssetReference {
              Id: 2059418368570458195
            }
          }
          Overrides {
            Name: "cs:CGU_GAME_PILLS"
            AssetReference {
              Id: 946292558430502305
            }
          }
          Overrides {
            Name: "cs:CGU_GAME_TRIVIA"
            AssetReference {
              Id: 7760809013425683607
            }
          }
          Overrides {
            Name: "cs:CGU_GAME_WHEEL"
            AssetReference {
              Id: 3428045961186627322
            }
          }
          Overrides {
            Name: "cs:CGU_GAME_BATTLE"
            AssetReference {
              Id: 7452069724475790907
            }
          }
          Overrides {
            Name: "cs:onlyWhenRoundEnds:tooltip"
            String: "[COMING SOON]If you use GameStateManager or Game.StartRound, if this is enabled, minigames only will be played when round ends. Default = enabled"
          }
          Overrides {
            Name: "cs:activateByEvent:tooltip"
            String: "[COMING SOON] If enabled,  games only could be played when received a event. Please set the event name in \'eventName\' property. In adittion, if enabled, this disable \'onlyWhenRoundEnds\' option. Default = disabled"
          }
          Overrides {
            Name: "cs:eventName:tooltip"
            String: "[COMING SOON] If \'activateByEvent\', please set the name of the event (server) and send \'true\' to activate or \'false\' to deactivate games"
          }
          Overrides {
            Name: "cs:savePlayerData:tooltip"
            String: "If enabled, statics and rewards  ( data type = Resources) will be saved using core regular Storage Player Data. If you have a different / customized system of player data , set this to false and save data (if needed) by your own. Default = enabled"
          }
          Overrides {
            Name: "cs:useChatTitles:tooltip"
            String: "[COMING SOON] If enabled, depending on the number of times, player has joined,  system can add a tittle to  players which will be shown each time he/she talks on chat. Can be customized. Default = enabled"
          }
          Overrides {
            Name: "cs:customResourceName:tooltip"
            String: "This will be the resource earned (the \'currency\') for player. This will be used to customize, statics, prizes... Default = wordies"
          }
          Overrides {
            Name: "cs:numResWhenJoin:tooltip"
            String: "Each time players joins game, will earn this quantity of \'points\'. This will be used for player retention, statics, daily prizes...Default = 5"
          }
          Overrides {
            Name: "cs:notDisturb:tooltip"
            String: "If enabled, players have access to command \'notDisturb\'. No messages will be sent to them.Default = disabled"
          }
          Overrides {
            Name: "cs:isGameVoted:tooltip"
            String: "If enabled, players decided which game will be the next with a vote. If disabled, next game will be random. Default = enabled"
          }
          Overrides {
            Name: "cs:loadTrivia:tooltip"
            String: "Game: Trivia"
          }
          Overrides {
            Name: "cs:loadWheelOfFortune:tooltip"
            String: "Game: Wheel Of Fortune"
          }
          Overrides {
            Name: "cs:loadHangmanGame:tooltip"
            String: "Game: Hangman"
          }
          Overrides {
            Name: "cs:loadSapiensPills:tooltip"
            String: "if enabled, a \'sapiens pill\' will be shown in the chat. Default = true"
          }
          Overrides {
            Name: "cs:staticsTimeServer:tooltip"
            String: "Statics>> If enabled, hours/minutes will be shown. Default = true"
          }
          Overrides {
            Name: "cs:debugPrint:tooltip"
            String: "If enabled, debug info will be shown in the editor log"
          }
          Overrides {
            Name: "cs:hang_prize:tooltip"
            String: "Prize to wint the game \'The Hangman\'"
          }
          Overrides {
            Name: "cs:hang_timeGame:tooltip"
            String: "When the timer reachs this time, \'The Hangman\' will end. In seconds"
          }
          Overrides {
            Name: "cs:battleShip_numMaxRounds:tooltip"
            String: "Max number of rounds before the game ends"
          }
          Overrides {
            Name: "cs:wheel_maxRounds:tooltip"
            String: "Max number of rounds before \'The Wheel of Fortune\' ends"
          }
          Overrides {
            Name: "cs:wheel_roundTime:tooltip"
            String: "A timer will be triggered at the beginning of each wheel round. When this reachs 0, the turn will be over"
          }
          Overrides {
            Name: "cs:battleShip_roundTime:tooltip"
            String: "Timer to shoot on your turn (Battleship)"
          }
          Overrides {
            Name: "cs:battleShip_SinkPoints:tooltip"
            String: "Internal parammeter. This is the total of hitPoints,, that all players/boards have. This number has to be equal to the slots occuped  by the ships "
          }
          Overrides {
            Name: "cs:battleShip_HitPoints:tooltip"
            String: "This is the basic multiplier to calculate player\'s points. When you hit a ship, you will get this quantity of points"
          }
          Overrides {
            Name: "cs:battleShip_ratioWinner:tooltip"
            String: "The winner of the \'BattleShip\' game will miltiply his points by this quantity"
          }
          Overrides {
            Name: "cs:battleShip_setTime:tooltip"
            String: "Time to setup your board if you didnt decided to setup \'auto\'"
          }
          Overrides {
            Name: "cs:trivia_timeGame:tooltip"
            String: "Timer to play to \'Trivia\', in seconds"
          }
          Overrides {
            Name: "cs:trivia_prizeM:tooltip"
            String: "Player who wins the game, will multiply his correct answers by this quantity"
          }
        }
        Collidable_v2 {
          Value: "mc:ecollisionsetting:inheritfromparent"
        }
        Visible_v2 {
          Value: "mc:evisibilitysetting:inheritfromparent"
        }
        CameraCollidable {
          Value: "mc:ecollisionsetting:inheritfromparent"
        }
        EditorIndicatorVisibility {
          Value: "mc:eindicatorvisibility:visiblewhenselected"
        }
        Folder {
          IsFilePartition: true
        }
      }
      Objects {
        Id: 85309066085185816
        Name: "CGU_README"
        Transform {
          Location {
          }
          Rotation {
          }
          Scale {
            X: 1
            Y: 1
            Z: 1
          }
        }
        ParentId: 17128609818188542397
        Collidable_v2 {
          Value: "mc:ecollisionsetting:inheritfromparent"
        }
        Visible_v2 {
          Value: "mc:evisibilitysetting:inheritfromparent"
        }
        CameraCollidable {
          Value: "mc:ecollisionsetting:inheritfromparent"
        }
        EditorIndicatorVisibility {
          Value: "mc:eindicatorvisibility:visiblewhenselected"
        }
        Script {
          ScriptAsset {
            Id: 12041611184831231799
          }
        }
      }
      Objects {
        Id: 2019243174432110835
        Name: "CGU_Main_server"
        Transform {
          Location {
          }
          Rotation {
          }
          Scale {
            X: 1
            Y: 1
            Z: 1
          }
        }
        ParentId: 17128609818188542397
        UnregisteredParameters {
          Overrides {
            Name: "cs:API_CONTENT_CGU"
            AssetReference {
              Id: 13703817516661525
            }
          }
          Overrides {
            Name: "cs:CVS_miniTimer"
            AssetReference {
              Id: 2519635131384947724
            }
          }
          Overrides {
            Name: "cs:CGU_BattleShip"
            AssetReference {
              Id: 16307170792558813986
            }
          }
          Overrides {
            Name: "cs:CGU_WheelOfFortune"
            AssetReference {
              Id: 8078971394011481076
            }
          }
          Overrides {
            Name: "cs:CGU_TheHangman"
            AssetReference {
              Id: 15702290654518377515
            }
          }
          Overrides {
            Name: "cs:CGU_Trivia"
            AssetReference {
              Id: 12488342968279189979
            }
          }
        }
        Collidable_v2 {
          Value: "mc:ecollisionsetting:inheritfromparent"
        }
        Visible_v2 {
          Value: "mc:evisibilitysetting:inheritfromparent"
        }
        CameraCollidable {
          Value: "mc:ecollisionsetting:inheritfromparent"
        }
        EditorIndicatorVisibility {
          Value: "mc:eindicatorvisibility:visiblewhenselected"
        }
        Script {
          ScriptAsset {
            Id: 1898590558952933047
          }
        }
      }
      Objects {
        Id: 7783089060453993173
        Name: "ClientContext"
        Transform {
          Location {
          }
          Rotation {
          }
          Scale {
            X: 1
            Y: 1
            Z: 1
          }
        }
        ParentId: 17128609818188542397
        ChildIds: 17622677366903287057
        Collidable_v2 {
          Value: "mc:ecollisionsetting:forceoff"
        }
        Visible_v2 {
          Value: "mc:evisibilitysetting:inheritfromparent"
        }
        CameraCollidable {
          Value: "mc:ecollisionsetting:inheritfromparent"
        }
        EditorIndicatorVisibility {
          Value: "mc:eindicatorvisibility:visiblewhenselected"
        }
        NetworkContext {
        }
      }
      Objects {
        Id: 17622677366903287057
        Name: "CGU_Main_client"
        Transform {
          Location {
          }
          Rotation {
          }
          Scale {
            X: 1
            Y: 1
            Z: 1
          }
        }
        ParentId: 7783089060453993173
        UnregisteredParameters {
          Overrides {
            Name: "cs:API_CONTENT_CGU"
            AssetReference {
              Id: 13703817516661525
            }
          }
        }
        Collidable_v2 {
          Value: "mc:ecollisionsetting:inheritfromparent"
        }
        Visible_v2 {
          Value: "mc:evisibilitysetting:inheritfromparent"
        }
        CameraCollidable {
          Value: "mc:ecollisionsetting:inheritfromparent"
        }
        EditorIndicatorVisibility {
          Value: "mc:eindicatorvisibility:visiblewhenselected"
        }
        Script {
          ScriptAsset {
            Id: 7884760982563717176
          }
        }
      }
    }
    PrimaryAssetId {
      AssetType: "None"
      AssetId: "None"
    }
  }
  Marketplace {
    Description: "Updated!\r\n\r\nIt\'s a set of four famous games to enjoy in between your main games fully customizable\r\nYou will find inside:\r\n - The Hangman\r\n - BattleShip\r\n - The Wheel of Fortune\r\n - Trivia \r\nAlso, you will be able to add some pills of wisdom to enlight your players ;)\r\n\r\nAll inside the chat!\r\nPlease read the Readme file!\r\n\r\n\r\nLOG\r\n----\r\n-Added: More sys messages to customize\r\n-Improved: \'BattleShip\' win logics\r\n-Fixed: BattleShip\' Now if you dont set the board, you don\'t get points in the end and game will end to you\r\n-Fixed: \'BattleShip\' Now /auto command works properly\r\n-Fixed: \'BattleShip\' some more minor bugs\r\n-Fixed: \'WheelOf\' now starts properly\r\n-Modify: \'BattleShip\' times for broadcasting and votes\r\n-Fixed: Now the vote system works properly\r\n-Fixed: Now manual battleship setup works properly\r\n"
  }
  SerializationVersion: 94
  DirectlyPublished: true
}
