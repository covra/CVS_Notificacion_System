Name: "Triggers"
RootId: 11304292159573722847
Objects {
  Id: 752384955713878352
  Name: "Trigger"
  Transform {
    Location {
      X: -310.473663
      Y: 49.4992
    }
    Rotation {
    }
    Scale {
      X: 1.71727264
      Y: 1.71727264
      Z: 1.71727264
    }
  }
  ParentId: 11304292159573722847
  ChildIds: 5483023971450015918
  ChildIds: 4028222835325206506
  ChildIds: 6482388751682539399
  UnregisteredParameters {
    Overrides {
      Name: "cs:code"
      String: "reset"
    }
    Overrides {
      Name: "cs:time"
      Float: 20
    }
    Overrides {
      Name: "cs:reverse"
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
  Trigger {
    Interactable: true
    InteractionLabel: "reset chrono!"
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
  Id: 6482388751682539399
  Name: "World Text"
  Transform {
    Location {
      X: -51.5629196
      Y: -62.4754333
      Z: 30.0314217
    }
    Rotation {
      Yaw: 90.3716
    }
    Scale {
      X: 1.60690558
      Y: 1.60690558
      Z: 1.60690558
    }
  }
  ParentId: 752384955713878352
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
    Text: "RESET"
    FontAsset {
    }
    Color {
      R: 0.964503288
      G: 1
      B: 0.329999983
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
  Id: 4028222835325206506
  Name: "Cube"
  Transform {
    Location {
    }
    Rotation {
    }
    Scale {
      X: 0.762155354
      Y: 0.583688796
      Z: 1.28032088
    }
  }
  ParentId: 752384955713878352
  UnregisteredParameters {
    Overrides {
      Name: "ma:Shared_BaseMaterial:id"
      AssetReference {
        Id: 6789131312706520264
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
  Id: 5483023971450015918
  Name: "2D Basic Shapes Decal"
  Transform {
    Location {
    }
    Rotation {
      Yaw: 90.4076385
    }
    Scale {
      X: 0.233339429
      Y: 0.233339429
      Z: 0.233339429
    }
  }
  ParentId: 752384955713878352
  UnregisteredParameters {
    Overrides {
      Name: "bp:Color"
      Color {
        R: 0.73543036
        G: 1
        B: 0.149999976
        A: 1
      }
    }
    Overrides {
      Name: "bp:Sides"
      Int: 4
    }
    Overrides {
      Name: "bp:Slice Size"
      Float: 298.596436
    }
    Overrides {
      Name: "bp:Corner Rounding"
      Float: 1
    }
    Overrides {
      Name: "bp:Indent"
      Float: 0
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
      Id: 9525911408065265468
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
  Id: 2682210646723002278
  Name: "Trigger"
  Transform {
    Location {
      X: -104.824669
      Y: 57.5965424
    }
    Rotation {
    }
    Scale {
      X: 1.67774773
      Y: 1.67774773
      Z: 1.67774773
    }
  }
  ParentId: 11304292159573722847
  ChildIds: 2881334997503131845
  ChildIds: 5440693496160261016
  ChildIds: 6881880896806143099
  UnregisteredParameters {
    Overrides {
      Name: "cs:code"
      String: "stop"
    }
    Overrides {
      Name: "cs:time"
      Float: 120
    }
    Overrides {
      Name: "cs:reverse"
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
  Trigger {
    Interactable: true
    InteractionLabel: "stop chrono?"
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
  Id: 6881880896806143099
  Name: "World Text"
  Transform {
    Location {
      X: -46.3196716
      Y: -62.4754333
      Z: 30.0311451
    }
    Rotation {
      Yaw: 90.3716
    }
    Scale {
      X: 1.60689783
      Y: 1.60689783
      Z: 1.60689783
    }
  }
  ParentId: 2682210646723002278
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
    Text: "STOP"
    FontAsset {
    }
    Color {
      R: 0.940000057
      G: 0.522913933
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
  Id: 5440693496160261016
  Name: "Cube"
  Transform {
    Location {
    }
    Rotation {
    }
    Scale {
      X: 0.762155235
      Y: 0.583688676
      Z: 1.28032064
    }
  }
  ParentId: 2682210646723002278
  UnregisteredParameters {
    Overrides {
      Name: "ma:Shared_BaseMaterial:id"
      AssetReference {
        Id: 6789131312706520264
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
  Id: 2881334997503131845
  Name: "2D Basic Shapes Decal"
  Transform {
    Location {
    }
    Rotation {
      Yaw: 90.4076385
    }
    Scale {
      X: 0.317002714
      Y: 0.317002714
      Z: 0.317002714
    }
  }
  ParentId: 2682210646723002278
  UnregisteredParameters {
    Overrides {
      Name: "bp:Color"
      Color {
        R: 0.809999943
        G: 0.20920527
        A: 1
      }
    }
    Overrides {
      Name: "bp:Sides"
      Int: 4
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
      Id: 9525911408065265468
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
  Id: 13949217730294737411
  Name: "Trigger"
  Transform {
    Location {
      X: 106.689835
      Y: 51.3615227
    }
    Rotation {
    }
    Scale {
      X: 1.63818526
      Y: 1.63818526
      Z: 1.63818526
    }
  }
  ParentId: 11304292159573722847
  ChildIds: 11905135025811660578
  ChildIds: 4340617840953032000
  ChildIds: 10220699162206125754
  UnregisteredParameters {
    Overrides {
      Name: "cs:code"
      String: "start"
    }
    Overrides {
      Name: "cs:time"
      Float: 120
    }
    Overrides {
      Name: "cs:reverse"
      Bool: true
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
    Interactable: true
    InteractionLabel: "start chrono?"
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
  Id: 10220699162206125754
  Name: "World Text"
  Transform {
    Location {
      X: -52.5766754
      Y: -62.4754333
      Z: 30.0313568
    }
    Rotation {
      Yaw: 90.3716
    }
    Scale {
      X: 1.60690355
      Y: 1.60690355
      Z: 1.60690355
    }
  }
  ParentId: 13949217730294737411
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
    Text: "START"
    FontAsset {
    }
    Color {
      R: 0.418277919
      G: 1
      B: 0.279999971
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
  Id: 4340617840953032000
  Name: "Cube"
  Transform {
    Location {
    }
    Rotation {
    }
    Scale {
      X: 0.762155116
      Y: 0.583688557
      Z: 1.28032041
    }
  }
  ParentId: 13949217730294737411
  UnregisteredParameters {
    Overrides {
      Name: "ma:Shared_BaseMaterial:id"
      AssetReference {
        Id: 6789131312706520264
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
  Id: 11905135025811660578
  Name: "2D Basic Shapes Decal"
  Transform {
    Location {
    }
    Rotation {
      Yaw: -89.2465515
    }
    Scale {
      X: 0.317002654
      Y: 0.317002654
      Z: 0.317002654
    }
  }
  ParentId: 13949217730294737411
  UnregisteredParameters {
    Overrides {
      Name: "bp:Color"
      Color {
        G: 0.960000038
        B: 0.082649231
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
      Id: 9525911408065265468
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
  Id: 1008502047905223721
  Name: "Trigger"
  Transform {
    Location {
      X: 323.74527
      Y: 45.9351463
    }
    Rotation {
    }
    Scale {
      X: 1.65796971
      Y: 1.65796971
      Z: 1.65796971
    }
  }
  ParentId: 11304292159573722847
  ChildIds: 13990391298901746403
  ChildIds: 9619334141270179277
  ChildIds: 6804356462879586164
  UnregisteredParameters {
    Overrides {
      Name: "cs:code"
      String: "start"
    }
    Overrides {
      Name: "cs:time"
      Float: 50
    }
    Overrides {
      Name: "cs:reverse"
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
  Trigger {
    Interactable: true
    InteractionLabel: "start chrono?"
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
  Id: 6804356462879586164
  Name: "World Text"
  Transform {
    Location {
      X: -38.9822044
      Y: -62.4754333
      Z: 30.0313148
    }
    Rotation {
      Yaw: 90.3716
    }
    Scale {
      X: 1.6069026
      Y: 1.6069026
      Z: 1.6069026
    }
  }
  ParentId: 1008502047905223721
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
    Text: "START"
    FontAsset {
    }
    Color {
      R: 0.418277919
      G: 1
      B: 0.279999971
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
  Id: 9619334141270179277
  Name: "Cube"
  Transform {
    Location {
    }
    Rotation {
    }
    Scale {
      X: 0.762155116
      Y: 0.583688557
      Z: 1.28032041
    }
  }
  ParentId: 1008502047905223721
  UnregisteredParameters {
    Overrides {
      Name: "ma:Shared_BaseMaterial:id"
      AssetReference {
        Id: 6789131312706520264
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
  Id: 13990391298901746403
  Name: "2D Basic Shapes Decal"
  Transform {
    Location {
    }
    Rotation {
      Yaw: 90.4076385
    }
    Scale {
      X: 0.317002654
      Y: 0.317002654
      Z: 0.317002654
    }
  }
  ParentId: 1008502047905223721
  UnregisteredParameters {
    Overrides {
      Name: "bp:Color"
      Color {
        G: 0.960000038
        B: 0.082649231
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
      Id: 9525911408065265468
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
