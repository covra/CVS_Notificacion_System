Name: "Custom Event"
RootId: 12618178547471106719
Objects {
  Id: 12840870140812969982
  Name: "TriggerArrivalDoors"
  Transform {
    Location {
    }
    Rotation {
      Yaw: 22.9978065
    }
    Scale {
      X: 4.67943335
      Y: 15.1758556
      Z: 10.8206387
    }
  }
  ParentId: 12618178547471106719
  ChildIds: 3855788577430624702
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
  Id: 3855788577430624702
  Name: "arrivalDoors"
  Transform {
    Location {
    }
    Rotation {
    }
    Scale {
      X: 0.213701084
      Y: 0.0658941418
      Z: 0.0924159884
    }
  }
  ParentId: 12840870140812969982
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
      Id: 16861022129357240546
    }
  }
}
