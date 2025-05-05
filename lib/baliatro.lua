-- // Code by baliame on Discord

BALIATRO = {}

BALIATRO.Images = {}

BALIATRO.Image = SMODS.GameObject:extend {
    obj_table = BALIATRO.Images,
    obj_buffer = {},
    required_params = {
        'key',
        'path',
    },
    set = 'Image',

    register = function(self)
        if self.registered then
            sendWarnMessage(('Detected duplicate register call on object %s'):format(self.key), self.set)
            return
        end
        self.name = self.key
        BALIATRO.Image.super.register(self)
    end,

    inject = function(self)
        local file_path = self.path
        self.full_path = (self.mod and self.mod.path or SMODS.path) ..
            'assets/1x/' .. file_path
        local file_data = assert(NFS.newFileData(self.full_path),
            ('Failed to collect file data for Image %s'):format(self.key))
        self.image_data = assert(love.image.newImageData(file_data),
            ('Failed to initialize image data for Image %s'):format(self.key))
        self.image = love.graphics.newImage(self.image_data,
            { mipmaps = true, dpiscale = G.SETTINGS.GRAPHICS.texture_scaling })
        local mipmap_level = SMODS.config.graphics_mipmap_level_options[SMODS.config.graphics_mipmap_level]
        if not self.disable_mipmap and mipmap_level and mipmap_level > 0 then
            self.image:setMipmapFilter('linear', mipmap_level)
        end
    end,
}