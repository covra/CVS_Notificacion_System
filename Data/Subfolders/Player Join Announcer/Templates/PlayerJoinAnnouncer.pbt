Assets {
  Id: 5995183576399286612
  Name: "PlayerJoinAnnouncer"
  PlatformAssetType: 5
  TemplateAsset {
    ObjectBlock {
      RootId: 5861592651447400277
      Objects {
        Id: 5861592651447400277
        Name: "PlayerJoinAnnouncer"
        Transform {
          Scale {
            X: 1
            Y: 1
            Z: 1
          }
        }
        ParentId: 17022140120531813420
        ChildIds: 14647642997763098621
        ChildIds: 9956670110032309558
        ChildIds: 3483694709198502465
        Collidable_v2 {
          Value: "mc:ecollisionsetting:inheritfromparent"
        }
        Visible_v2 {
          Value: "mc:evisibilitysetting:inheritfromparent"
        }
        CameraCollidable {
          Value: "mc:ecollisionsetting:inheritfromparent"
        }
        Control {
          RenderTransformPivot {
            Anchor {
              Value: "mc:euianchor:middlecenter"
            }
          }
          Canvas {
            Opacity: 1
          }
          AnchorLayout {
            SelfAnchor {
              Anchor {
                Value: "mc:euianchor:topleft"
              }
            }
            TargetAnchor {
              Anchor {
                Value: "mc:euianchor:topleft"
              }
            }
          }
        }
      }
      Objects {
        Id: 14647642997763098621
        Name: "ModifiedFluidUI"
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
        ParentId: 5861592651447400277
        UnregisteredParameters {
          Overrides {
            Name: "cs:HelpfulFunctions"
            AssetReference {
              Id: 3604484554059747504
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
        Script {
          ScriptAsset {
            Id: 148245317058247513
          }
        }
      }
      Objects {
        Id: 9956670110032309558
        Name: "PlayerJoinAnnouncer"
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
        ParentId: 5861592651447400277
        UnregisteredParameters {
          Overrides {
            Name: "cs:PlayerJoinAnnouncerTemplate"
            AssetReference {
              Id: 14053442888215053078
            }
          }
          Overrides {
            Name: "cs:Content"
            ObjectReference {
              SubObjectId: 3483694709198502465
            }
          }
          Overrides {
            Name: "cs:StayTime"
            Float: 3
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
        Script {
          ScriptAsset {
            Id: 3577435542966849819
          }
        }
      }
      Objects {
        Id: 3483694709198502465
        Name: "Content"
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
        ParentId: 5861592651447400277
        UnregisteredParameters {
          Overrides {
            Name: "cs:ListSize"
            Vector2 {
              X: 0.15
            }
          }
          Overrides {
            Name: "cs:ListGap"
            Float: -15
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
        Control {
          Width: 600
          Height: 300
          UIX: 32
          UIY: 8
          RenderTransformPivot {
            Anchor {
              Value: "mc:euianchor:middlecenter"
            }
          }
          Panel {
            Opacity: 1
          }
          AnchorLayout {
            SelfAnchor {
              Anchor {
                Value: "mc:euianchor:topleft"
              }
            }
            TargetAnchor {
              Anchor {
                Value: "mc:euianchor:topleft"
              }
            }
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
    Description: "Announces when a player joins the game!"
  }
  SerializationVersion: 94
  DirectlyPublished: true
}
