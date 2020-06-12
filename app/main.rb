require "app/perspective-sprite.rb"


def init
  $gtk.args.grid.origin_center!
  $gtk.args.state.box_one = PerspectiveSprite.new 10, 10, 100, 100, "sprites/square-blue.png"
end


def tick args
  init if args.state.tick_count == 0

  if(args.inputs.keyboard.key_down.down)
    args.state.box_one.increase_distance
  end

  if(args.inputs.keyboard.key_down.up)
    args.state.box_one.decrease_distance
  end

  args.outputs.sprites << args.state.box_one
end