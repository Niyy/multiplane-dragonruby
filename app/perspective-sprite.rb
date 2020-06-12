class Sprite
    attr_accessor :x, :y, :w, :h, :path, :angle, :a, :r, :g, :b, :source_x,
                    :source_y, :source_w, :source_h, :flip_horizontally,
                    :flip_vertically, :angle_anchor_x, :angle_anchor_y,
                    :tile_x, :tile_y, :tile_w, :tile_h

    def primitive_marker
        :sprite
    end
end
  
  
class PerspectiveSprite < Sprite
    attr_accessor :level

    @orig_x
    @orig_y
    @orig_w
    @orig_h

    def initialize x, y, w, h, i_sprite
        self.x = @orig_x = x #- (w/2)
        self.y = @orig_y = y #- (h/2)
        self.w = @orig_w = w
        self.h = @orig_h = h
        self.path = i_sprite
    end

    def increase_distance
        self.w -= self.w * 0.1
        self.h -= self.h * 0.1

        inch_toward_horizon
    end

    def decrease_distance
        self.w += self.w * 0.1
        self.h += self.h * 0.1
    end

    def inch_toward_horizon
        dist_result = distance([0, 0], [self.x, self.y])

        self.x += dist_result * 0.1
        self.y += dist_result * 0.1
    end

    def distance(point1, point2)
        x_sq = (point1[0] - point2[0])**2
        y_sq = (point1[1] - point2[1])**2

        return Math.sqrt(x_sq + y_sq);
    end

    def linear_dist(point1, point2)
        return 
    end

    def serialize
        { }
    end

    
    def inspect
        serialize.to_s
    end

    
    def to_s
        serialize.to_s
    end
    
end