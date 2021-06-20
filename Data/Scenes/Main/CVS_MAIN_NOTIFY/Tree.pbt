Name: "CVS_MAIN_NOTIFY"
RootId: 6123358238075253963
Objects {
  Id: 18345247503990147141
  Name: "CVS UI Notify Container"
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
  ParentId: 6123358238075253963
  ChildIds: 13023236116120575272
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
  Control {
    RenderTransformPivot {
      Anchor {
        Value: "mc:euianchor:middlecenter"
      }
    }
    Canvas {
      ContentType {
        Value: "mc:ecanvascontenttype:dynamic"
      }
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
  Id: 13023236116120575272
  Name: "UI localPlayer"
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
  ParentId: 18345247503990147141
  ChildIds: 3522004003215888449
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
  }
}
Objects {
  Id: 3522004003215888449
  Name: "UI Side Panel"
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
  ParentId: 13023236116120575272
  ChildIds: 11227862616581909598
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
  Control {
    Width: 400
    Height: 100
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
          Value: "mc:euianchor:topright"
        }
      }
      TargetAnchor {
        Anchor {
          Value: "mc:euianchor:topright"
        }
      }
    }
  }
}
Objects {
  Id: 11227862616581909598
  Name: "actiPanel"
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
  ParentId: 3522004003215888449
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
  Control {
    Width: 100
    Height: 30
    RenderTransformPivot {
      Anchor {
        Value: "mc:euianchor:middlecenter"
      }
    }
    UseParentWidth: true
    UseParentHeight: true
    Button {
      FontColor {
        A: 1
      }
      FontSize: 20
      ButtonColor {
        R: 0.7
        G: 0.958278
        B: 1
        A: 0.18
      }
      HoveredColor {
        R: 1
        G: 1
        B: 1
        A: 1
      }
      PressedColor {
        R: 1
        G: 1
        B: 1
        A: 1
      }
      DisabledColor {
        R: 1
        G: 1
        B: 1
        A: 1
      }
      Brush {
        Id: 10880425547465120048
      }
      IsButtonEnabled: true
      OnlyUseMainColor: true
      ClickMode {
        Value: "mc:ebuttonclickmode:default"
      }
      Font {
      }
      Justification {
        Value: "mc:etextjustify:center"
      }
      VerticalJustification {
        Value: "mc:everticaljustification:center"
      }
      ShadowColor {
        A: 1
      }
      ShadowOffset {
      }
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
  Id: 9252152554801488365
  Name: "CVS_common_client"
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
  ParentId: 6123358238075253963
  ChildIds: 179921866786970504
  ChildIds: 5460872397360442958
  UnregisteredParameters {
    Overrides {
      Name: "cs:stack_SideRight"
      Bool: true
    }
    Overrides {
      Name: "cs:player_Join"
      Bool: true
    }
    Overrides {
      Name: "cs:player_hitPoints"
      Bool: false
    }
    Overrides {
      Name: "cs:player_Leave"
      Bool: true
    }
    Overrides {
      Name: "cs:player_Died"
      Bool: true
    }
    Overrides {
      Name: "cs:player_Damage"
      Bool: false
    }
    Overrides {
      Name: "cs:player_friend"
      Bool: false
    }
    Overrides {
      Name: "cs:game_Purchase"
      Bool: false
    }
    Overrides {
      Name: "cs:game_specialAbility"
      Bool: false
    }
    Overrides {
      Name: "cs:game_specialEquipment"
      Bool: true
    }
    Overrides {
      Name: "cs:game_Rounds"
      Bool: false
    }
    Overrides {
      Name: "cs:world_Trigger"
      Bool: false
    }
    Overrides {
      Name: "cs:world_Custom"
      Bool: false
    }
    Overrides {
      Name: "cs:debugPrint"
      Bool: true
    }
    Overrides {
      Name: "cs:stack_Width"
      Int: 20
    }
    Overrides {
      Name: "cs:stack_Height"
      Int: 90
    }
    Overrides {
      Name: "cs:fadeOut_isEnabled"
      Bool: true
    }
    Overrides {
      Name: "cs:fadeOut_Time"
      Float: 5
    }
    Overrides {
      Name: "cs:selfDestroy_time"
      Float: 25
    }
    Overrides {
      Name: "cs:stackTemplate"
      AssetReference {
        Id: 862480760006374578
      }
    }
    Overrides {
      Name: "cs:animDestroyC"
      SimpleCurve {
        Keys {
          Interpolation {
            Value: "mc:erichcurveinterpmode:rcim_cubic"
          }
          TangentMode {
            Value: "mc:erichcurvetangentmode:rctm_user"
          }
          Value: 100
          ArriveTangent: -256.236694
          LeaveTangent: -256.236694
        }
        Keys {
          Interpolation {
            Value: "mc:erichcurveinterpmode:rcim_cubic"
          }
          TangentMode {
            Value: "mc:erichcurvetangentmode:rctm_user"
          }
          Time: 0.5
          Value: 70
          ArriveTangent: 2.15541625
          LeaveTangent: 2.15541625
        }
        Keys {
          Interpolation {
            Value: "mc:erichcurveinterpmode:rcim_linear"
          }
          TangentMode {
            Value: "mc:erichcurvetangentmode:rctm_auto"
          }
          Time: 1
          Value: 120
        }
        PreExtrapolation {
          Value: "mc:erichcurveextrapolation:rcce_constant"
        }
        PostExtrapolation {
          Value: "mc:erichcurveextrapolation:rcce_constant"
        }
        DefaultValue: 3.40282347e+38
      }
    }
    Overrides {
      Name: "cs:stack_SideRight:tooltip"
      String: "The place where stack side notifications will appear. If enabled: right, disabled: left "
    }
    Overrides {
      Name: "cs:stack_Width:tooltip"
      String: "Width of the notification area in percentage. Default:15%"
    }
    Overrides {
      Name: "cs:stack_Height:tooltip"
      String: "Height  of the notification area in percentage. Default:80%"
    }
    Overrides {
      Name: "cs:fadeOut_isEnabled:tooltip"
      String: "If enabled, the stack side panel will be fade out after \'fadeOut_time\' seconds"
    }
    Overrides {
      Name: "cs:fadeOut_Time:tooltip"
      String: "Time en seconds to fadeOut if enabled. Default = 5"
    }
    Overrides {
      Name: "cs:selfDestroy_time:tooltip"
      String: "Time in seconds to auto-destroy the stack notifications. If BLANK = NO destroyed"
    }
  }
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
  Id: 5460872397360442958
  Name: "CVS_autoSize"
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
  ParentId: 9252152554801488365
  UnregisteredParameters {
    Overrides {
      Name: "cs:UINotifyContainer"
      ObjectReference {
        SelfId: 18345247503990147141
      }
    }
    Overrides {
      Name: "cs:CVS_NOTIFY_API"
      AssetReference {
        Id: 9724488856710647903
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
      Id: 4237125095293494043
    }
  }
}
Objects {
  Id: 179921866786970504
  Name: "CVS_common"
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
  ParentId: 9252152554801488365
  UnregisteredParameters {
    Overrides {
      Name: "cs:CVS_NOTIFY_API"
      AssetReference {
        Id: 9724488856710647903
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
      Id: 7059359564255596754
    }
  }
}
Objects {
  Id: 14026530112312545952
  Name: "CVS_Main_notify"
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
  ParentId: 6123358238075253963
  UnregisteredParameters {
    Overrides {
      Name: "cs:CVS_NOTIFY_API"
      AssetReference {
        Id: 9724488856710647903
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
      Id: 15322257319999727061
    }
  }
}
