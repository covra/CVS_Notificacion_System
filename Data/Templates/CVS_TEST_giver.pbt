Assets {
  Id: 1506096741987714207
  Name: "CVS_TEST_giver"
  PlatformAssetType: 5
  TemplateAsset {
    ObjectBlock {
      RootId: 15115775802848148272
      Objects {
        Id: 15115775802848148272
        Name: "CVS_TEST_giver"
        Transform {
          Scale {
            X: 1
            Y: 1
            Z: 1
          }
        }
        ParentId: 4781671109827199097
        ChildIds: 14061860241227837818
        ChildIds: 18363864338815350655
        UnregisteredParameters {
          Overrides {
            Name: "cs:vDador"
            Float: 0.5
          }
          Overrides {
            Name: "cs:tick_Enabled"
            Bool: false
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
        Id: 14061860241227837818
        Name: "CVS_giver"
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
        ParentId: 15115775802848148272
        UnregisteredParameters {
          Overrides {
            Name: "cs:Trigger"
            ObjectReference {
              SubObjectId: 10316884855975715860
            }
          }
          Overrides {
            Name: "cs:trig_res_op1"
            ObjectReference {
              SubObjectId: 10316884855975715860
            }
          }
          Overrides {
            Name: "cs:trig_res_op2"
            ObjectReference {
              SubObjectId: 4859105434786407168
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
            Id: 15284605153544335158
          }
        }
      }
      Objects {
        Id: 18363864338815350655
        Name: "StaticContext"
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
        ParentId: 15115775802848148272
        ChildIds: 10316884855975715860
        ChildIds: 9786107421381471965
        ChildIds: 432935842514191967
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
        NetworkContext {
          Type: RuntimeStatic
        }
      }
      Objects {
        Id: 10316884855975715860
        Name: "Trigger"
        Transform {
          Location {
            Z: 170.738205
          }
          Rotation {
          }
          Scale {
            X: 5.27556467
            Y: 5.27556467
            Z: 5.27556467
          }
        }
        ParentId: 18363864338815350655
        ChildIds: 16710275854932513901
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
        Trigger {
          Interactable: true
          InteractionLabel: "Give me 1"
          TeamSettings {
            IsTeamCollisionEnabled: true
            IsEnemyCollisionEnabled: true
          }
          TriggerShape_v2 {
            Value: "mc:etriggershape:box"
          }
        }
      }
      Objects {
        Id: 16710275854932513901
        Name: "Cube"
        Transform {
          Location {
            Y: 45.1249886
          }
          Rotation {
          }
          Scale {
            X: 0.97224611
            Y: 0.443239778
            Z: 0.97224611
          }
        }
        ParentId: 10316884855975715860
        UnregisteredParameters {
          Overrides {
            Name: "ma:Shared_BaseMaterial:id"
            AssetReference {
              Id: 1877631086947265554
            }
          }
        }
        Collidable_v2 {
          Value: "mc:ecollisionsetting:forceoff"
        }
        Visible_v2 {
          Value: "mc:evisibilitysetting:inheritfromparent"
        }
        CameraCollidable {
          Value: "mc:ecollisionsetting:forceoff"
        }
        EditorIndicatorVisibility {
          Value: "mc:eindicatorvisibility:visiblewhenselected"
        }
        CoreMesh {
          MeshAsset {
            Id: 12095835209017042614
          }
          Teams {
            IsTeamCollisionEnabled: true
            IsEnemyCollisionEnabled: true
          }
          StaticMesh {
            Physics {
              Mass: 100
              LinearDamping: 0.01
            }
            BoundsScale: 1
          }
        }
      }
      Objects {
        Id: 9786107421381471965
        Name: "res"
        Transform {
          Location {
            X: -140.82843
            Y: 280.656158
            Z: -3.05175781e-05
          }
          Rotation {
          }
          Scale {
            X: 1
            Y: 1
            Z: 1
          }
        }
        ParentId: 18363864338815350655
        ChildIds: 12985664230557058459
        ChildIds: 15268737436531686901
        ChildIds: 16513103441135518478
        ChildIds: 5541296161564099495
        UnregisteredParameters {
          Overrides {
            Name: "cs:option"
            String: "core"
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
          IsGroup: true
        }
      }
      Objects {
        Id: 12985664230557058459
        Name: "trigger"
        Transform {
          Location {
            Z: 135.552551
          }
          Rotation {
          }
          Scale {
            X: 1.25169897
            Y: 1.32534564
            Z: 4.88168335
          }
        }
        ParentId: 9786107421381471965
        UnregisteredParameters {
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
        Trigger {
          TeamSettings {
            IsTeamCollisionEnabled: true
            IsEnemyCollisionEnabled: true
          }
          TriggerShape_v2 {
            Value: "mc:etriggershape:box"
          }
        }
      }
      Objects {
        Id: 15268737436531686901
        Name: "Decal Family Crest 01"
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
        ParentId: 9786107421381471965
        UnregisteredParameters {
          Overrides {
            Name: "bp:Shape Index"
            Int: 0
          }
          Overrides {
            Name: "bp:Color"
            Color {
              R: 0.559999943
              A: 1
            }
          }
          Overrides {
            Name: "bp:Color Shapes"
            Color {
              R: 0.929999948
              G: 0.27715233
              A: 1
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
        Blueprint {
          BlueprintAsset {
            Id: 1210208156186585702
          }
          TeamSettings {
          }
          DecalBP {
          }
        }
        Relevance {
          Value: "mc:eproxyrelevance:medium"
        }
      }
      Objects {
        Id: 16513103441135518478
        Name: "World Text"
        Transform {
          Location {
            X: -118.274506
            Y: -62.7471
            Z: 49.02808
          }
          Rotation {
            Yaw: 91.8985443
          }
          Scale {
            X: 3.16107082
            Y: 3.16107082
            Z: 3.16107082
          }
        }
        ParentId: 9786107421381471965
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
        Text {
          Text: "apples"
          FontAsset {
          }
          Color {
            R: 0.63
            G: 0.0750993341
            A: 1
          }
          HorizontalSize: 1
          VerticalSize: 1
          HorizontalAlignment {
            Value: "mc:ecoretexthorizontalalign:left"
          }
          VerticalAlignment {
            Value: "mc:ecoretextverticalalign:center"
          }
        }
      }
      Objects {
        Id: 5541296161564099495
        Name: "World Text"
        Transform {
          Location {
            X: -118.274506
            Y: -62.7471
            Z: 100.541687
          }
          Rotation {
            Yaw: 91.8985443
          }
          Scale {
            X: 3.16107082
            Y: 3.16107082
            Z: 3.16107082
          }
        }
        ParentId: 9786107421381471965
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
        Text {
          Text: "CORE"
          FontAsset {
          }
          Color {
            R: 0.75
            A: 1
          }
          HorizontalSize: 1
          VerticalSize: 1
          HorizontalAlignment {
            Value: "mc:ecoretexthorizontalalign:left"
          }
          VerticalAlignment {
            Value: "mc:ecoretextverticalalign:center"
          }
        }
      }
      Objects {
        Id: 432935842514191967
        Name: "res"
        Transform {
          Location {
            X: 109.332245
            Y: 280.656158
            Z: -3.05175781e-05
          }
          Rotation {
          }
          Scale {
            X: 1
            Y: 1
            Z: 1
          }
        }
        ParentId: 18363864338815350655
        ChildIds: 4859105434786407168
        ChildIds: 12879126595946971416
        ChildIds: 2726758307461532278
        ChildIds: 7566009512110912572
        UnregisteredParameters {
          Overrides {
            Name: "cs:option"
            String: "event"
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
          IsGroup: true
        }
      }
      Objects {
        Id: 4859105434786407168
        Name: "trigger"
        Transform {
          Location {
            Y: 61.1126099
            Z: 118.190918
          }
          Rotation {
          }
          Scale {
            X: 1.25169897
            Y: 1.32534564
            Z: 3.20764899
          }
        }
        ParentId: 432935842514191967
        UnregisteredParameters {
          Overrides {
            Name: "cs:option"
            String: "event"
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
        Trigger {
          TeamSettings {
            IsTeamCollisionEnabled: true
            IsEnemyCollisionEnabled: true
          }
          TriggerShape_v2 {
            Value: "mc:etriggershape:box"
          }
        }
      }
      Objects {
        Id: 12879126595946971416
        Name: "Decal Family Crest 01"
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
        ParentId: 432935842514191967
        UnregisteredParameters {
          Overrides {
            Name: "bp:Shape Index"
            Int: 0
          }
          Overrides {
            Name: "bp:Color"
            Color {
              G: 0.63
              B: 0.0792715102
              A: 1
            }
          }
          Overrides {
            Name: "bp:Color Shapes"
            Color {
              R: 0.230397329
              G: 0.49
              A: 1
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
        Blueprint {
          BlueprintAsset {
            Id: 1210208156186585702
          }
          TeamSettings {
          }
          DecalBP {
          }
        }
        Relevance {
          Value: "mc:eproxyrelevance:medium"
        }
      }
      Objects {
        Id: 2726758307461532278
        Name: "World Text"
        Transform {
          Location {
            X: -118.274506
            Y: -62.7471
            Z: 49.02808
          }
          Rotation {
            Yaw: 91.8985443
          }
          Scale {
            X: 3.16107082
            Y: 3.16107082
            Z: 3.16107082
          }
        }
        ParentId: 432935842514191967
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
        Text {
          Text: "apples"
          FontAsset {
          }
          Color {
            R: 0.103708461
            G: 0.539999962
            A: 1
          }
          HorizontalSize: 1
          VerticalSize: 1
          HorizontalAlignment {
            Value: "mc:ecoretexthorizontalalign:left"
          }
          VerticalAlignment {
            Value: "mc:ecoretextverticalalign:center"
          }
        }
      }
      Objects {
        Id: 7566009512110912572
        Name: "World Text"
        Transform {
          Location {
            X: -118.274506
            Y: -62.7471
            Z: 108.746155
          }
          Rotation {
            Yaw: 91.8985443
          }
          Scale {
            X: 3.16107082
            Y: 3.16107082
            Z: 3.16107082
          }
        }
        ParentId: 432935842514191967
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
        Text {
          Text: "EVENT"
          FontAsset {
          }
          Color {
            R: 0.524569511
            G: 0.89
            A: 1
          }
          HorizontalSize: 1
          VerticalSize: 1
          HorizontalAlignment {
            Value: "mc:ecoretexthorizontalalign:left"
          }
          VerticalAlignment {
            Value: "mc:ecoretextverticalalign:center"
          }
        }
      }
    }
    Assets {
      Id: 12095835209017042614
      Name: "Cube"
      PlatformAssetType: 1
      PrimaryAsset {
        AssetType: "StaticMeshAssetRef"
        AssetId: "sm_cube_002"
      }
    }
    Assets {
      Id: 1877631086947265554
      Name: "Additive Edgeline Top Fade"
      PlatformAssetType: 2
      PrimaryAsset {
        AssetType: "MaterialAssetRef"
        AssetId: "fxmi_add_edgeline_sharpline_topfade"
      }
    }
    Assets {
      Id: 1210208156186585702
      Name: "Decal Family Crest 01"
      PlatformAssetType: 14
      PrimaryAsset {
        AssetType: "DecalBlueprintAssetRef"
        AssetId: "bp_decal_jpn_family_crest_001_ref"
      }
    }
    PrimaryAssetId {
      AssetType: "None"
      AssetId: "None"
    }
  }
  SerializationVersion: 94
}
