Assets {
  Id: 2913118081729711871
  Name: "CVS_Resource Notifier_2"
  PlatformAssetType: 5
  TemplateAsset {
    ObjectBlock {
      RootId: 6350053372433218162
      Objects {
        Id: 6350053372433218162
        Name: "CVS_Resource Notifier_2"
        Transform {
          Scale {
            X: 1
            Y: 1
            Z: 1
          }
        }
        ParentId: 4781671109827199097
        ChildIds: 18211350676323759603
        ChildIds: 6831719445523185003
        ChildIds: 5506759928507101706
        UnregisteredParameters {
          Overrides {
            Name: "cs:resource_Name"
            String: "coins"
          }
          Overrides {
            Name: "cs:resource_CoreResources"
            Bool: false
          }
          Overrides {
            Name: "cs:resource_CustomEvent"
            Bool: true
          }
          Overrides {
            Name: "cs:resource_CustomEventName"
            String: "giveMeCoins"
          }
          Overrides {
            Name: "cs:resource_Icon"
            ObjectReference {
              SubObjectId: 8950130998223280575
            }
          }
          Overrides {
            Name: "cs:resource_pBar"
            ObjectReference {
            }
          }
          Overrides {
            Name: "cs:resource_Quantity"
            ObjectReference {
              SubObjectId: 16684106292950566008
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
            Bool: false
          }
          Overrides {
            Name: "cs:stackBoxes_customQty"
            Bool: true
          }
          Overrides {
            Name: "cs:stackBoxes_Qty_1"
            Int: 30
          }
          Overrides {
            Name: "cs:stackBoxes_Qty_2"
            Int: 100
          }
          Overrides {
            Name: "cs:stackBoxes_Qty_3"
            Int: 1000
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
            Bool: false
          }
          Overrides {
            Name: "cs:customNewQuantity"
            Int: 50
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
        Id: 18211350676323759603
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
        ParentId: 6350053372433218162
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
        Id: 6831719445523185003
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
        ParentId: 6350053372433218162
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
        Id: 5506759928507101706
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
        ParentId: 6350053372433218162
        ChildIds: 12889176958046357424
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
        Id: 12889176958046357424
        Name: "HUD Resource Panel Variant 1"
        Transform {
          Scale {
            X: 1
            Y: 1
            Z: 1
          }
        }
        ParentId: 5506759928507101706
        ChildIds: 16688780635972565273
        ChildIds: 8950130998223280575
        ChildIds: 16684106292950566008
        ChildIds: 8775694075520574061
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
          UIX: 344.888977
          UIY: -4.51254272
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
        Id: 16688780635972565273
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
        ParentId: 12889176958046357424
        ChildIds: 15271510953717436759
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
        Id: 15271510953717436759
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
        ParentId: 16688780635972565273
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
        Id: 8950130998223280575
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
        ParentId: 12889176958046357424
        ChildIds: 15767447811052439672
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
          RenderTransformPivot {
            Anchor {
              Value: "mc:euianchor:middlecenter"
            }
          }
          Image {
            Brush {
              Id: 5270929790800875786
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
        Id: 15767447811052439672
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
        ParentId: 8950130998223280575
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
              Id: 5270929790800875786
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
        Id: 16684106292950566008
        Name: "Resource Number"
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
        ParentId: 12889176958046357424
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
          Width: 155
          Height: 45
          UIX: 75
          UIY: 5
          RenderTransformPivot {
            Anchor {
              Value: "mc:euianchor:middlecenter"
            }
          }
          Text {
            Label: "123,456"
            Color {
              R: 1
              G: 1
              B: 1
              A: 1
            }
            Size: 24
            Justification {
              Value: "mc:etextjustify:center"
            }
            AutoWrapText: true
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
                Value: "mc:euianchor:middleleft"
              }
            }
          }
        }
      }
      Objects {
        Id: 8775694075520574061
        Name: "Button Plus"
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
        ParentId: 12889176958046357424
        ChildIds: 17520473380342007909
        ChildIds: 854923517838921763
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
          Width: 32
          Height: 32
          UIX: 108.258545
          RenderTransformPivot {
            Anchor {
              Value: "mc:euianchor:middlecenter"
            }
          }
          Button {
            FontColor {
              A: 1
            }
            FontSize: 20
            ButtonColor {
              R: 0.191201717
              G: 0.783538043
              B: 0.0116122467
              A: 1
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
              Id: 6631813437871576255
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
        Id: 17520473380342007909
        Name: "Light"
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
        ParentId: 8775694075520574061
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
          AddSizeToParentIfUsingParentSize: true
          UseParentWidth: true
          UseParentHeight: true
          Image {
            Brush {
              Id: 15357133247247472435
            }
            Color {
              R: 0.536149919
              G: 0.783538043
              B: 0.461144745
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
        Id: 854923517838921763
        Name: "Icon"
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
        ParentId: 8775694075520574061
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
          Width: -14
          Height: -14
          RotationAngle: 45
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
              Id: 9035591144150604460
            }
            Color {
              G: 0.0599999428
              B: 0.0158940405
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
      Id: 5270929790800875786
      Name: "Fantasy Coins 006"
      PlatformAssetType: 9
      PrimaryAsset {
        AssetType: "PlatformBrushAssetRef"
        AssetId: "UI_Fantasy_Equip_Coins_006"
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
    Assets {
      Id: 6631813437871576255
      Name: "BG Flat 002"
      PlatformAssetType: 9
      PrimaryAsset {
        AssetType: "PlatformBrushAssetRef"
        AssetId: "BackgroundNoOutline_019"
      }
    }
    Assets {
      Id: 15357133247247472435
      Name: "UI Gradient Circular 001"
      PlatformAssetType: 9
      PrimaryAsset {
        AssetType: "PlatformBrushAssetRef"
        AssetId: "UI_Basic_Shape_001"
      }
    }
    Assets {
      Id: 9035591144150604460
      Name: "Icon Close"
      PlatformAssetType: 9
      PrimaryAsset {
        AssetType: "PlatformBrushAssetRef"
        AssetId: "Icon_Close"
      }
    }
    PrimaryAssetId {
      AssetType: "None"
      AssetId: "None"
    }
  }
  SerializationVersion: 89
}
