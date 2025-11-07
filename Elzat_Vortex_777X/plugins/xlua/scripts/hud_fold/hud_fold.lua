-- 内部变量保存状态
local hud_left_value  = 0
local hud_right_value = 0

-- 左 HUD toggle，可读可写
elzat_hud_left = create_dataref("elzat/hud_left/fold_toggle", "number",
    function(val)
        if val ~= nil then
            hud_left_value = val  -- 外部写入触发这里
        end
        return hud_left_value    -- 外部读取触发这里
    end
)

-- 右 HUD toggle，可读可写
elzat_hud_right = create_dataref("elzat/hud_right/fold_toggle", "number",
    function(val)
        if val ~= nil then
            hud_right_value = val
        end
        return hud_right_value
    end
)
