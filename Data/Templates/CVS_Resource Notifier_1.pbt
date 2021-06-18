Assets {
  Id: 14953656989554526189
  Name: "CVS_Resource Notifier_1"
  PlatformAssetType: 5
  TemplateAsset {
    ObjectBlock {
      RootId: 10628867355028092052
      Objects {
        Id: 10628867355028092052
        Name: "CVS_Resource Notifier_1"
        Transform {
          Scale {
            X: 1
            Y: 1
            Z: 1
          }
        }
        ParentId: 4781671109827199097
        ChildIds: 13691958677187993
        ChildIds: 5045589045410616054
        ChildIds: 9404539356379398022
        UnregisteredParameters {
          Overrides {
            Name: "cs:resource_Name"
            String: "apples"
          }
          Overrides {
            Name: "cs:resource_CoreResources"
            Bool: true
          }
          Overrides {
            Name: "cs:resource_CustomEvent"
            Bool: false
          }
          Overrides {
            Name: "cs:resource_CustomEventName"
            String: "goApples"
          }
          Overrides {
            Name: "cs:resource_Icon"
            ObjectReference {
              SubObjectId: 13190025391068344059
            }
          }
          Overrides {
            Name: "cs:resource_pBar"
            ObjectReference {
              SubObjectId: 5279088476541932729
            }
          }
          Overrides {
            Name: "cs:resource_Quantity"
            ObjectReference {
              SubObjectId: 10838252125885397424
            }
          }
          Overrides {
            Name: "cs:scale_Multiplier"
            Float: 10
          }
          Overrides {
            Name: "cs:scale_Speed_Multiplier"
            Float: 0.08
          }
          Overrides {
            Name: "cs:debugPrint"
            Bool: true
          }
          Overrides {
            Name: "cs:stackBoxes_res1"
            Bool: false
          }
          Overrides {
            Name: "cs:stackBoxes_fullBar"
            Bool: true
          }
          Overrides {
            Name: "cs:stackBoxes_customQty"
            Bool: true
          }
          Overrides {
            Name: "cs:stackBoxes_Qty_1"
            Int: 10
          }
          Overrides {
            Name: "cs:stackBoxes_Qty_2"
            Int: 20
          }
          Overrides {
            Name: "cs:stackBoxes_Qty_3"
            Int: 40
          }
          Overrides {
            Name: "cs:Initial_ProgressBar"
            Int: 10
          }
          Overrides {
            Name: "cs:fullBar_Double"
            Bool: false
          }
          Overrides {
            Name: "cs:fullBar_addCustom"
            Bool: true
          }
          Overrides {
            Name: "cs:customNewQuantity"
            Int: 50
          }
          Overrides {
            Name: "cs:CVS_NOTIFY_API"
            AssetReference {
              Id: 9724488856710647903
            }
          }
          Overrides {
            Name: "cs:scale_Multiplier:tooltip"
            String: "Multiplier of the final size of the scale. Higher values make icon larger in animation. Default = 10"
          }
          Overrides {
            Name: "cs:resource_Icon:tooltip"
            String: "Icon to animate. Leave it in blank to NO animation"
          }
          Overrides {
            Name: "cs:resource_Quantity:tooltip"
            String: "Text to animate. Leave in blank to NO animation"
          }
          Overrides {
            Name: "cs:scale_Speed_Multiplier:tooltip"
            String: "Speed of the animation to get the scale. Lower values get slower velocities. Default = 0.08"
          }
          Overrides {
            Name: "cs:resource_Name:tooltip"
            String: "Name of the resource associated to the animation"
          }
          Overrides {
            Name: "cs:debugPrint:tooltip"
            String: "If enabled, show debug information in the Log"
          }
          Overrides {
            Name: "cs:resource_CoreResources:tooltip"
            String: "If enabled , when the Resource (from CORE API) changes, the animation will be triggered. It is necessary to specify the name of the resource in \'resource_Name\'"
          }
          Overrides {
            Name: "cs:resource_CustomEvent:tooltip"
            String: "If enabled, the animation will be triggered by a custom Event. You will have set a name in \'resource_CustomEventName\' field. If both activation methods would be actived, resources from Core will have preference. You can add in the Broadcast the new value to the resource.   A typical call should be:            Events.BroadcastToPlayer(player,\"nameOfEvent\", player, newValue)"
          }
          Overrides {
            Name: "cs:resource_CustomEventName:tooltip"
            String: "Name of your custom Event"
          }
          Overrides {
            Name: "cs:stackBoxes_res1:tooltip"
            String: "If enabled, the system will send a stack box to notification area when that resource grow 1"
          }
          Overrides {
            Name: "cs:stackBoxes_fullBar:tooltip"
            String: "If enabled, the system will send a stackBox to notification area when progressBar will be full"
          }
          Overrides {
            Name: "cs:Initial_ProgressBar:tooltip"
            String: "Yo can set here the maximun number of items to fill the  progressBar"
          }
          Overrides {
            Name: "cs:customNewQuantity:tooltip"
            String: "When progress Bar is full. System will add this new maximun quantity of elements"
          }
          Overrides {
            Name: "cs:fullBar_Double:tooltip"
            String: "When  progressBar is full, system will add \'maxItems_ProgressBar\' again to make it larger"
          }
          Overrides {
            Name: "cs:fullBar_addCustom:tooltip"
            String: "When  progressBar is full, system will add \'customNewQuantity\' again to make it larger"
          }
          Overrides {
            Name: "cs:stackBoxes_customQty:tooltip"
            String: "If enabled, system will send a notification when  items get \'stackBoxes_Qty\'"
          }
          Overrides {
            Name: "cs:stackBoxes_Qty_1:tooltip"
            String: "When you get these resource number, notification will be sent. Leave in blank if NO notification required"
          }
          Overrides {
            Name: "cs:resource_pBar:tooltip"
            String: "Progress Bar to animate. Leave it in blank to NO animation"
          }
          Overrides {
            Name: "cs:stackBoxes_Qty_2:tooltip"
            String: "When you get these resource number, notification will be sent. Leave in blank if NO notification required"
          }
          Overrides {
            Name: "cs:stackBoxes_Qty_3:tooltip"
            String: "When you get these resource number, notification will be sent. Leave in blank if NO notification required"
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
        Id: 13691958677187993
        Name: "README_NOTIFY"
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
        ParentId: 10628867355028092052
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
        Id: 5045589045410616054
        Name: "CVS_mainControl"
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
        ParentId: 10628867355028092052
        UnregisteredParameters {
          Overrides {
            Name: "cs:curveAnim"
            SimpleCurve {
              Keys {
                Interpolation {
                  Value: "mc:erichcurveinterpmode:rcim_cubic"
                }
                TangentMode {
                  Value: "mc:erichcurvetangentmode:rctm_user"
                }
                ArriveTangent: -0.0556136295
                LeaveTangent: -0.0556136295
              }
              Keys {
                Interpolation {
                  Value: "mc:erichcurveinterpmode:rcim_cubic"
                }
                TangentMode {
                  Value: "mc:erichcurvetangentmode:rctm_auto"
                }
                Time: 0.0129195228
                Value: 1.02524114
                ArriveTangent: 3.51686263
                LeaveTangent: 3.51686263
              }
              Keys {
                Interpolation {
                  Value: "mc:erichcurveinterpmode:rcim_cubic"
                }
                TangentMode {
                  Value: "mc:erichcurvetangentmode:rctm_auto"
                }
                Time: 0.317063868
                Value: 1.1150701
                ArriveTangent: 10.1604567
                LeaveTangent: 10.1604567
              }
              Keys {
                Interpolation {
                  Value: "mc:erichcurveinterpmode:rcim_cubic"
                }
                TangentMode {
                  Value: "mc:erichcurvetangentmode:rctm_user"
                }
                Time: 0.397407413
                Value: 4.93181372
                ArriveTangent: -0.0738982409
                LeaveTangent: -0.0738982409
              }
              Keys {
                Interpolation {
                  Value: "mc:erichcurveinterpmode:rcim_cubic"
                }
                TangentMode {
                  Value: "mc:erichcurvetangentmode:rctm_user"
                }
                Time: 0.716752827
                ArriveTangent: -43.3456306
                LeaveTangent: -43.3456306
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
            Id: 12554279392177893476
          }
        }
      }
      Objects {
        Id: 9404539356379398022
        Name: "UI Container"
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
        ParentId: 10628867355028092052
        ChildIds: 9817942701836203108
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
        Id: 9817942701836203108
        Name: "UI_Resource"
        Transform {
          Scale {
            X: 1
            Y: 1
            Z: 1
          }
        }
        ParentId: 9404539356379398022
        ChildIds: 2210904740500135584
        ChildIds: 5279088476541932729
        ChildIds: 13190025391068344059
        ChildIds: 10838252125885397424
        UnregisteredParameters {
          Overrides {
            Name: "cs:resName"
            String: "apples"
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
        Control {
          Width: 280
          Height: 52
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
                Value: "mc:euianchor:middlecenter"
              }
            }
            TargetAnchor {
              Anchor {
                Value: "mc:euianchor:middlecenter"
              }
            }
          }
        }
      }
      Objects {
        Id: 2210904740500135584
        Name: "Background"
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
        ParentId: 9817942701836203108
        ChildIds: 15356804445842706922
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
          Width: -40
          UIX: 40
          RenderTransformPivot {
            Anchor {
              Value: "mc:euianchor:middlecenter"
            }
          }
          AddSizeToParentIfUsingParentSize: true
          UseParentWidth: true
          UseParentHeight: true
          Image {
            Brush {
              Id: 2063992707042945453
            }
            Color {
              A: 1
            }
            TeamSettings {
            }
          }
          AnchorLayout {
            SelfAnchor {
              Anchor {
                Value: "mc:euianchor:middleleft"
              }
            }
            TargetAnchor {
              Anchor {
                Value: "mc:euianchor:middleleft"
              }
            }
          }
        }
      }
      Objects {
        Id: 15356804445842706922
        Name: "Background"
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
        ParentId: 2210904740500135584
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
          Width: -4
          Height: -4
          UIX: 2
          RenderTransformPivot {
            Anchor {
              Value: "mc:euianchor:middlecenter"
            }
          }
          AddSizeToParentIfUsingParentSize: true
          UseParentWidth: true
          UseParentHeight: true
          Image {
            Brush {
              Id: 2063992707042945453
            }
            Color {
              R: 0.00604883675
              G: 0.0262411535
              B: 0.097587347
              A: 0.8
            }
            TeamSettings {
            }
          }
          AnchorLayout {
            SelfAnchor {
              Anchor {
                Value: "mc:euianchor:middleleft"
              }
            }
            TargetAnchor {
              Anchor {
                Value: "mc:euianchor:middleleft"
              }
            }
          }
        }
      }
      Objects {
        Id: 5279088476541932729
        Name: "Progress Bar"
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
        ParentId: 9817942701836203108
        ChildIds: 13506956898966363303
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
          Width: -65
          Height: 41
          UIX: 56.3803711
          UIY: -0.592956543
          RenderTransformPivot {
            Anchor {
              Value: "mc:euianchor:middlecenter"
            }
          }
          AddSizeToParentIfUsingParentSize: true
          UseParentWidth: true
          StatBar {
            Color {
              R: 0.9
              G: 0.0715232
              A: 1
            }
            BackgroundColor {
              R: 0.1
              G: 0.1
              B: 0.1
              A: 1
            }
            Percent: 1
            FillBrush {
            }
            BackgroundBrush {
            }
          }
          AnchorLayout {
            SelfAnchor {
              Anchor {
                Value: "mc:euianchor:middleleft"
              }
            }
            TargetAnchor {
              Anchor {
                Value: "mc:euianchor:middleleft"
              }
            }
          }
        }
      }
      Objects {
        Id: 13506956898966363303
        Name: "Shadow"
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
        ParentId: 5279088476541932729
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
          Width: 8
          UIX: -3.75
          RenderTransformPivot {
            Anchor {
              Value: "mc:euianchor:middlecenter"
            }
          }
          AddSizeToParentIfUsingParentSize: true
          UseParentWidth: true
          UseParentHeight: true
          Image {
            Brush {
              Id: 7140991974003550896
            }
            Color {
              A: 0.5
            }
            TeamSettings {
            }
          }
          AnchorLayout {
            SelfAnchor {
              Anchor {
                Value: "mc:euianchor:middleleft"
              }
            }
            TargetAnchor {
              Anchor {
                Value: "mc:euianchor:middleleft"
              }
            }
          }
        }
      }
      Objects {
        Id: 13190025391068344059
        Name: "Resource Icon ( outline )"
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
        ParentId: 9817942701836203108
        ChildIds: 3542890820105511640
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
          Width: 78
          Height: 78
          UIX: 7.5
          UIY: -3
          RenderTransformPivot {
            Anchor {
              Value: "mc:euianchor:middlecenter"
            }
          }
          Image {
            Brush {
              Id: 15852695469757419520
            }
            Color {
              A: 1
            }
            TeamSettings {
            }
          }
          AnchorLayout {
            SelfAnchor {
              Anchor {
                Value: "mc:euianchor:middleleft"
              }
            }
            TargetAnchor {
              Anchor {
                Value: "mc:euianchor:middleleft"
              }
            }
          }
        }
      }
      Objects {
        Id: 3542890820105511640
        Name: "Resource Icon"
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
        ParentId: 13190025391068344059
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
          Width: -12
          Height: -12
          RenderTransformPivot {
            Anchor {
              Value: "mc:euianchor:middlecenter"
            }
          }
          AddSizeToParentIfUsingParentSize: true
          UseParentWidth: true
          UseParentHeight: true
          Image {
            Brush {
              Id: 15852695469757419520
            }
            Color {
              R: 1
              G: 1
              B: 1
              A: 1
            }
            TeamSettings {
            }
          }
          AnchorLayout {
            SelfAnchor {
              Anchor {
                Value: "mc:euianchor:middlecenter"
              }
            }
            TargetAnchor {
              Anchor {
                Value: "mc:euianchor:middlecenter"
              }
            }
          }
        }
      }
      Objects {
        Id: 10838252125885397424
        Name: "currentRes"
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
        ParentId: 9817942701836203108
        ChildIds: 13681329661956558650
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
          Width: 198
          Height: 40
          UIX: -76.1939774
          UIY: 4.04567528
          RenderTransformPivot {
            Anchor {
              Value: "mc:euianchor:middlecenter"
            }
          }
          Text {
            Label: "0"
            Color {
              R: 1
              G: 1
              B: 1
              A: 1
            }
            Size: 24
            Justification {
              Value: "mc:etextjustify:right"
            }
            AutoWrapText: true
            Font {
              Id: 7681686264374787666
            }
            VerticalJustification {
              Value: "mc:everticaljustification:center"
            }
          }
          AnchorLayout {
            SelfAnchor {
              Anchor {
                Value: "mc:euianchor:middlecenter"
              }
            }
            TargetAnchor {
              Anchor {
                Value: "mc:euianchor:middlecenter"
              }
            }
          }
        }
      }
      Objects {
        Id: 13681329661956558650
        Name: "res Total"
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
        ParentId: 10838252125885397424
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
          Width: 198
          Height: 40
          RenderTransformPivot {
            Anchor {
              Value: "mc:euianchor:middlecenter"
            }
          }
          Text {
            Label: " / 10"
            Color {
              R: 1
              G: 1
              B: 1
              A: 1
            }
            Size: 24
            Justification {
              Value: "mc:etextjustify:left"
            }
            Font {
              Id: 15274808845524457639
            }
            VerticalJustification {
              Value: "mc:everticaljustification:center"
            }
          }
          AnchorLayout {
            SelfAnchor {
              Anchor {
                Value: "mc:euianchor:middleleft"
              }
            }
            TargetAnchor {
              Anchor {
                Value: "mc:euianchor:middleright"
              }
            }
          }
        }
      }
    }
    Assets {
      Id: 2063992707042945453
      Name: "BG Flat 001"
      PlatformAssetType: 9
      PrimaryAsset {
        AssetType: "PlatformBrushAssetRef"
        AssetId: "BackgroundNoOutline_020"
      }
    }
    Assets {
      Id: 7140991974003550896
      Name: "BG Highlighted 001"
      PlatformAssetType: 9
      PrimaryAsset {
        AssetType: "PlatformBrushAssetRef"
        AssetId: "BackgroundHighlighted_020"
      }
    }
    Assets {
      Id: 15852695469757419520
      Name: "Fantasy Fruit 004"
      PlatformAssetType: 9
      PrimaryAsset {
        AssetType: "PlatformBrushAssetRef"
        AssetId: "UI_Fantasy_Food_Fruit_004"
      }
    }
    Assets {
      Id: 7681686264374787666
      Name: "Luckiest Guy"
      PlatformAssetType: 28
      PrimaryAsset {
        AssetType: "FontAssetRef"
        AssetId: "LuckiestGuyRegular_ref"
      }
    }
    Assets {
      Id: 15274808845524457639
      Name: "Luckiest Guy"
      PlatformAssetType: 28
      PrimaryAsset {
        AssetType: "FontAssetRef"
        AssetId: "LuckiestGuyRegular_ref"
      }
    }
    PrimaryAssetId {
      AssetType: "None"
      AssetId: "None"
    }
  }
  SerializationVersion: 89
}
