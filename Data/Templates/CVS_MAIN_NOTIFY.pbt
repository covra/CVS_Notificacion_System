Assets {
  Id: 6625448334782390838
  Name: "CVS_MAIN_NOTIFY"
  PlatformAssetType: 5
  TemplateAsset {
    ObjectBlock {
      RootId: 11474132654469940491
      Objects {
        Id: 11474132654469940491
        Name: "CVS_MAIN_NOTIFY"
        Transform {
          Scale {
            X: 1
            Y: 1
            Z: 1
          }
        }
        ParentId: 4781671109827199097
        ChildIds: 14047379548523703240
        ChildIds: 4355762145975937595
        ChildIds: 10371374027365986297
        UnregisteredParameters {
          Overrides {
            Name: "cs:player_Join"
            Bool: true
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
            Name: "cs:player_HP"
            Bool: true
          }
          Overrides {
            Name: "cs:player_customHP"
            Int: 30
          }
          Overrides {
            Name: "cs:game_specialEquipment"
            Bool: true
          }
          Overrides {
            Name: "cs:stack_SideRight"
            Bool: true
          }
          Overrides {
            Name: "cs:world_Custom"
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
            Name: "cs:selfDestroy_time"
            Float: 60
          }
          Overrides {
            Name: "cs:debugPrint"
            Bool: true
          }
          Overrides {
            Name: "cs:CVS_NOTIFY_API"
            AssetReference {
              Id: 9724488856710647903
            }
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
            Name: "cs:selfDestroy_time:tooltip"
            String: "Time in seconds to auto-destroy the stack notifications. If BLANK = NO destroyed"
          }
          Overrides {
            Name: "cs:player_Join:tooltip"
            String: "If enabled will notify when a player joins"
          }
          Overrides {
            Name: "cs:player_Leave:tooltip"
            String: "If enabled will notify when a player leaves"
          }
          Overrides {
            Name: "cs:player_Died:tooltip"
            String: "If enabled will notify when a player died"
          }
          Overrides {
            Name: "cs:game_specialEquipment:tooltip"
            String: "If enabled, the system will look for special equipment (you should type its name before, in  \'tableGame\' in API), and when equipped, will notify "
          }
          Overrides {
            Name: "cs:stack_SideRight:tooltip"
            String: "Pre-defined area for notifications"
          }
          Overrides {
            Name: "cs:debugPrint:tooltip"
            String: "If enabled,  debug info will appear in the log"
          }
          Overrides {
            Name: "cs:world_Custom:tooltip"
            String: "If enabled, the system will look for pre-defined events (should be included in table \'WORLD custom\' before). When the would be broadcasted to server, the system will notify.  ie     Events.Broadcast(\"poolParty\",\"WORLD\", player)"
          }
          Overrides {
            Name: "cs:player_HP:tooltip"
            String: "If enabled,  the system will notify player hitPoints are under damage zone"
          }
          Overrides {
            Name: "cs:player_customHP:tooltip"
            String: "Under this value of player hit points, if  \'player_HP\' is enabled, the system will send a notification"
          }
          Overrides {
            Name: "cs:animDestroyC:tooltip"
            String: "Interna curve of animation"
          }
          Overrides {
            Name: "cs:CVS_NOTIFY_API:tooltip"
            String: "API. You can customize inside a lot of parammeters"
          }
          Overrides {
            Name: "cs:stackTemplate:tooltip"
            String: "This is the stack_window template of reference. You can customize it"
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
          FilePartitionName: "CVS_MAIN_NOTIFY"
        }
      }
      Objects {
        Id: 14047379548523703240
        Name: "README"
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
        ParentId: 11474132654469940491
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
            Id: 1332376685964187867
          }
        }
      }
      Objects {
        Id: 4355762145975937595
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
        ParentId: 11474132654469940491
        UnregisteredParameters {
          Overrides {
            Name: "cs:CVS_NOTIFY_API"
            AssetReference {
              Id: 9724488856710647903
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
            Id: 15322257319999727061
          }
        }
      }
      Objects {
        Id: 10371374027365986297
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
        ParentId: 11474132654469940491
        ChildIds: 2692058296919984838
        ChildIds: 17155205904068256660
        ChildIds: 7678615897134832717
        UnregisteredParameters {
          Overrides {
            Name: "cs:debugPrint"
            Bool: true
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
        Id: 2692058296919984838
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
        ParentId: 10371374027365986297
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
        Id: 17155205904068256660
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
        ParentId: 10371374027365986297
        UnregisteredParameters {
          Overrides {
            Name: "cs:UINotifyContainer"
            ObjectReference {
              SubObjectId: 7678615897134832717
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
        Id: 7678615897134832717
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
        ParentId: 10371374027365986297
        ChildIds: 429124473361206919
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
        Id: 429124473361206919
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
        ParentId: 7678615897134832717
        ChildIds: 9077608672434339689
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
        Id: 9077608672434339689
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
        ParentId: 429124473361206919
        ChildIds: 3104473669953927606
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
        Id: 3104473669953927606
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
        ParentId: 9077608672434339689
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
    }
    Assets {
      Id: 10880425547465120048
      Name: "BG Gradient 001"
      PlatformAssetType: 9
      PrimaryAsset {
        AssetType: "PlatformBrushAssetRef"
        AssetId: "BackgroundFlat_020"
      }
    }
    PrimaryAssetId {
      AssetType: "None"
      AssetId: "None"
    }
  }
  SerializationVersion: 89
}
