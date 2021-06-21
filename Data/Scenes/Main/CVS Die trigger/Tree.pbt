Name: "CVS Die trigger"
RootId: 106814241381884066
Objects {
  Id: 14915259046865047399
  Name: "Bone Human Skull Pile 01"
  Transform {
    Location {
      X: -166.250488
      Y: -15.0631104
      Z: -74.1909637
    }
    Rotation {
    }
    Scale {
      X: 1.29299092
      Y: 1.29299092
      Z: 1.29299092
    }
  }
  ParentId: 106814241381884066
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
  CoreMesh {
    MeshAsset {
      Id: 9413195517882184592
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
  Id: 15513128941169836570
  Name: "Decal Burnt Streaks 01"
  Transform {
    Location {
      X: -88.3527832
      Y: -36.8248291
      Z: -93.3462219
    }
    Rotation {
      Pitch: 0.176403284
      Yaw: 129.261108
    }
    Scale {
      X: 0.783455312
      Y: 0.783455312
      Z: 0.783455312
    }
  }
  ParentId: 106814241381884066
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
      Id: 1085692155132102910
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
  Id: 12413843006693799272
  Name: "Trigger"
  Transform {
    Location {
      X: -121.442139
      Y: -53.9528809
      Z: -80.7744293
    }
    Rotation {
      Yaw: 23.9540882
    }
    Scale {
      X: 2.38608027
      Y: 1.96456623
      Z: 1.52674234
    }
  }
  ParentId: 106814241381884066
  ChildIds: 12871531363241392407
  ChildIds: 5551046855948919891
  Collidable_v2 {
    Value: "mc:ecollisionsetting:forceon"
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
  Id: 5551046855948919891
  Name: "fx"
  Transform {
    Location {
      X: -38.3012619
      Y: -1.21626544
      Z: -33.9305077
    }
    Rotation {
    }
    Scale {
      X: 1
      Y: 1
      Z: 1
    }
  }
  ParentId: 12413843006693799272
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
    FilePartitionName: "fx"
  }
}
Objects {
  Id: 12871531363241392407
  Name: "CVS_die_trigg"
  Transform {
    Location {
    }
    Rotation {
    }
    Scale {
      X: 0.356010556
      Y: 0.356010556
      Z: 0.356010556
    }
  }
  ParentId: 12413843006693799272
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
      Id: 908091434014378152
    }
  }
}
