Assets {
  Id: 15702290654518377515
  Name: "CGU_TheHangman"
  PlatformAssetType: 5
  TemplateAsset {
    ObjectBlock {
      RootId: 13337097510249435985
      Objects {
        Id: 13337097510249435985
        Name: "CGU_TheHangman"
        Transform {
          Scale {
            X: 1
            Y: 1
            Z: 1
          }
        }
        ParentId: 4781671109827199097
        ChildIds: 2943256376192322941
        ChildIds: 13908131143795796958
        UnregisteredParameters {
          Overrides {
            Name: "cs:code"
            String: "HANGMAN"
          }
        }
        WantsNetworking: true
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
        Id: 2943256376192322941
        Name: "CVS_Hangman_server"
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
        ParentId: 13337097510249435985
        UnregisteredParameters {
          Overrides {
            Name: "cs:CGU_GAME_HANGMAN"
            AssetReference {
              Id: 2059418368570458195
            }
          }
          Overrides {
            Name: "cs:CVS_miniTimer"
            AssetReference {
              Id: 2519635131384947724
            }
          }
        }
        WantsNetworking: true
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
            Id: 14075881410875348408
          }
        }
      }
      Objects {
        Id: 13908131143795796958
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
        ParentId: 13337097510249435985
        ChildIds: 7482353164354386677
        UnregisteredParameters {
          Overrides {
            Name: "cs:numMaxRounds"
            Int: 10
          }
          Overrides {
            Name: "cs:maxTimeRound"
            Float: 10
          }
          Overrides {
            Name: "cs:numMaxRounds:isrep"
            Bool: true
          }
          Overrides {
            Name: "cs:maxTimeRound:isrep"
            Bool: true
          }
        }
        WantsNetworking: true
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
        Id: 7482353164354386677
        Name: "CVS_Hangman_client"
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
        ParentId: 13908131143795796958
        UnregisteredParameters {
          Overrides {
            Name: "cs:CGU_GAME_HANGMAN"
            AssetReference {
              Id: 2059418368570458195
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
            Id: 11722436546855063566
          }
        }
      }
    }
    PrimaryAssetId {
      AssetType: "None"
      AssetId: "None"
    }
  }
  SerializationVersion: 94
}
