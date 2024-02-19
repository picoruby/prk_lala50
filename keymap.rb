# This is the keymap.rb for LALA50
# https://booth.pm/en/items/5402795

require "consumer_key"
require "mouse"

kbd = Keyboard.new

p1, p2, p3, p4, p5, p6, p7, p8 = 4, 26, 2, 27, 7, 28, 6, 29

# 13x4 matrix
kbd.init_matrix_pins(
  [
    [ [p1,p2], [p1,p3], [p1,p4], [p1,p5], [p1,p6], [p1,p7], [p1,p8], [p2,p1], [p2,p3], [p2,p4], [p2,p5], [p2,p6], [p2,p7] ],
    [ [p2,p8], [p3,p1], [p3,p2], [p3,p4], [p3,p5], [p3,p6], [p3,p7], [p3,p8], [p4,p1], [p4,p2], [p4,p3], [p4,p5], [p4,p6] ],
    [ [p4,p7], [p4,p8], [p5,p1], [p5,p2], [p5,p3], [p5,p4], [p5,p6], [p5,p7], [p5,p8], [p6,p1], [p6,p2], [p6,p3], [p6,p4] ],
    [ [p6,p5], [p6,p7], [p6,p8], [p7,p1], [p7,p2], [p7,p3], [p7,p4], [p7,p5], [p7,p6], [p7,p8], [p8,p1], [p8,p2], [p8,p3] ]
  ]
)

kbd.add_layer :default, %i[
  KC_ESC   KC_Q    KC_W    KC_E    KC_R    KC_T      KC_VOLU  KC_Y      KC_U    KC_I     KC_O     KC_P     KC_MINUS
  KC_TAB   KC_A    KC_S    KC_D    KC_F    KC_G      KC_VOLD  KC_H      KC_J    KC_K     KC_L     KC_SCLN  KC_BSPACE
  KC_LSFT  KC_Z    KC_X    KC_C    KC_V    KC_B      KC_MUTE  KC_N      KC_M    KC_COMMA KC_DOT   KC_SLASH KC_RSFT
  KC_BTN1  KC_BTN2 KC_LGUI KC_LALT KC_LCTL LOWER_SPC RGB_TOG  RAISE_ENT IME     KC_LEFT  KC_DOWN  KC_UP    KC_RIGHT
]
kbd.add_layer :raise, %i[
  KC_GRAVE KC_EXLM KC_AT   KC_HASH KC_DLR  KC_PERC   KC_VOLU  KC_CIRC   KC_AMPR KC_ASTER KC_LPRN  KC_RPRN  KC_EQUAL
  KC_TAB   KC_LABK KC_LCBR KC_LBRC KC_LPRN KC_QUOTE  KC_VOLD  KC_LEFT   KC_DOWN KC_UP    KC_RIGHT KC_UNDS  KC_PIPE
  KC_LSFT  KC_RABK KC_RCBR KC_RBRC KC_RPRN KC_DQUO   KC_MUTE  KC_TILD   KC_BSLS KC_COMMA KC_DOT   KC_SLASH KC_RSFT
  KC_BTN1  KC_BTN2 KC_LGUI KC_LALT KC_LCTL LOWER_SPC RGB_TOG  RAISE_ENT IME     KC_LEFT  KC_DOWN  KC_UP    KC_RIGHT
]
kbd.add_layer :lower, %i[
  KC_ESC   KC_1    KC_2    KC_3    KC_4    KC_5      KC_VOLU  KC_6      KC_7    KC_8     KC_9     KC_0     KC_EQUAL
  KC_TAB   KC_LABK KC_LCBR KC_LBRC KC_LPRN KC_QUOTE  KC_VOLD  KC_LEFT   KC_DOWN KC_UP    KC_RIGHT KC_NO    KC_BSPACE
  KC_LSFT  KC_RABK KC_RCBR KC_RBRC KC_RPRN KC_DQUO   KC_MUTE  KC_NO     KC_NO   KC_NO    KC_NO    KC_NO    KC_COMMA
  KC_BTN1  KC_BTN2 KC_LGUI KC_LALT KC_LCTL LOWER_SPC RGB_TOG  RAISE_ENT IME     KC_LEFT  KC_DOWN  KC_UP    KC_RIGHT
]

kbd.define_composite_key :IME, %i(KC_RSFT KC_RCTL KC_BSPACE)
kbd.define_mode_key :RAISE_ENT, [ :KC_ENTER, :raise, 150, 150 ]
kbd.define_mode_key :LOWER_SPC, [ :KC_SPACE, :lower, 150, 150 ]

rgb = RGB.new(
  3,      # pin number
  0,      # size of underglow pixel
  13 * 4  # size of backlight pixel
)
rgb.effect = :swirl
rgb.speed = 25
kbd.append rgb

# LALA50 doesn't have a trackball, we only report buttons
mouse = Mouse.new(driver: nil)
mouse.task do |mouse, keyboard|
  USB.merge_mouse_report(0, 0, 0, 0, 0)
end
kbd.append mouse

kbd.start!
