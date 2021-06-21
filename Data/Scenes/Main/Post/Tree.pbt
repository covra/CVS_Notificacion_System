Name: "Post"
RootId: 15805476522128077188
Objects {
  Id: 4783710033155806244
  Name: "Vignette Grain Post Process"
  Transform {
    Location {
      X: -84.4347
      Y: 229.874969
      Z: 2.23653515e-05
    }
    Rotation {
      Yaw: -99.3601227
    }
    Scale {
      X: 5.71655273
      Y: 18.2327251
      Z: 11.1532679
    }
  }
  ParentId: 15805476522128077188
  UnregisteredParameters {
    Overrides {
      Name: "bp:Unbounded"
      Bool: false
    }
    Overrides {
      Name: "bp:Vignette Intensity"
      Float: 1
    }
    Overrides {
      Name: "bp:Grain Jitter"
      Float: 0.54496932
    }
    Overrides {
      Name: "bp:Grain Intensity"
      Float: 1
    }
    Overrides {
      Name: "bp:Visible In Preview"
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
  Blueprint {
    BlueprintAsset {
      Id: 3963343907753383895
    }
    TeamSettings {
    }
  }
}
Objects {
  Id: 11952258310429625728
  Name: "Motion Blur Post Process"
  Transform {
    Location {
      X: -48.6141548
      Y: 302.899506
      Z: 0.000111826754
    }
    Rotation {
      Yaw: -91.6566086
    }
    Scale {
      X: 7.65496159
      Y: 7.65496159
      Z: 7.65496159
    }
  }
  ParentId: 15805476522128077188
  UnregisteredParameters {
    Overrides {
      Name: "bp:Unbounded"
      Bool: false
    }
    Overrides {
      Name: "bp:Intensity"
      Float: 2
    }
    Overrides {
      Name: "bp:Visible In Preview"
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
  Blueprint {
    BlueprintAsset {
      Id: 4221271819903619494
    }
    TeamSettings {
    }
  }
}
Objects {
  Id: 3676038523719619034
  Name: "Chromatic Aberration Post Process Volume"
  Transform {
    Location {
      X: 63.4125977
      Y: -91.4665833
      Z: 0.000111826754
    }
    Rotation {
      Yaw: -83.2429428
    }
    Scale {
      X: 22.6202374
      Y: 22.6202374
      Z: 22.6202374
    }
  }
  ParentId: 15805476522128077188
  UnregisteredParameters {
    Overrides {
      Name: "bp:Unbounded"
      Bool: false
    }
    Overrides {
      Name: "bp:Visible In Preview"
      Bool: false
    }
    Overrides {
      Name: "bp:Intensity"
      Float: 1
    }
    Overrides {
      Name: "bp:Start Offset"
      Float: 0.719466507
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
      Id: 15346549427277167116
    }
    TeamSettings {
    }
  }
}
Objects {
  Id: 8792470624131929675
  Name: "Bloom Post Process"
  Transform {
    Location {
      X: -10.2221622
      Y: -117.2285
      Z: 2.23653515e-05
    }
    Rotation {
      Yaw: -87.189415
    }
    Scale {
      X: 21.4964123
      Y: 21.4964123
      Z: 21.4964123
    }
  }
  ParentId: 15805476522128077188
  UnregisteredParameters {
    Overrides {
      Name: "bp:Unbounded"
      Bool: false
    }
    Overrides {
      Name: "bp:Visible In Preview"
      Bool: false
    }
    Overrides {
      Name: "bp:Intensity"
      Float: 15
    }
    Overrides {
      Name: "bp:Threshold"
      Float: 9.74770546
    }
    Overrides {
      Name: "bp:Size Scale"
      Float: 15
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
      Id: 15987419909793638300
    }
    TeamSettings {
    }
  }
}
Objects {
  Id: 12925804975282667608
  Name: "Ambient Occlusion Post Process"
  Transform {
    Location {
      X: -4.57668877
      Y: -94.2038116
      Z: 4.47307029e-05
    }
    Rotation {
      Yaw: -88.8848724
    }
    Scale {
      X: 24.9164333
      Y: 24.9164333
      Z: 24.9164333
    }
  }
  ParentId: 15805476522128077188
  UnregisteredParameters {
    Overrides {
      Name: "bp:Intensity"
      Float: 1
    }
    Overrides {
      Name: "bp:Blend Weight"
      Float: 1
    }
    Overrides {
      Name: "bp:Unbounded"
      Bool: false
    }
    Overrides {
      Name: "bp:Radius"
      Float: 1000
    }
    Overrides {
      Name: "bp:Radius In World Space"
      Bool: true
    }
    Overrides {
      Name: "bp:Fade Out Distance"
      Float: 10000
    }
    Overrides {
      Name: "bp:Fade Out Radius"
      Float: 5988.43652
    }
    Overrides {
      Name: "bp:Power"
      Float: 8
    }
    Overrides {
      Name: "bp:Blend Radius"
      Float: 500
    }
    Overrides {
      Name: "bp:Priority"
      Float: 10
    }
    Overrides {
      Name: "bp:Visible In Preview"
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
  Blueprint {
    BlueprintAsset {
      Id: 7399190049350569276
    }
    TeamSettings {
    }
  }
}
