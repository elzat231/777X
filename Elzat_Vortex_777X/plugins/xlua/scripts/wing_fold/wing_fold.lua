-- wing_fold.lua  (minimal, XLua)
-- 用途：创建一个简单、可被面板写入的 dataref 并在外部写入时打印日志

-- 本地存储（初始值）
local fold_ratio = 0.0

-- 创建 writable dataref
-- 注意：XLua 的 create_dataref 可以有第三个参数作为 "外部写入回调"（该回调没有参数）
-- 当面板或其他插件写入此 dataref 时，XLua 会把变量 fold_ratio 更新为新值，
-- 然后调用这里的回调（如果提供）以便我们能检测外部写入事件。
local dr = create_dataref("elzat/wing/fold_ratio", "number",
    function()
        -- 这个回调在“外部”（例如 2D 面板 / Plane Maker）写入时被调用
        print("XLua: elzat/wing/fold_ratio was written externally ->", fold_ratio)
    end
)

-- 打印模块加载信息，便于调试
print("XLua wing_fold module loaded. DataRef elzat/wing/fold_ratio created. Initial:", fold_ratio)

-- (可选) 我们不在这里做映射 AFM 的动作——先确保 dataref 能被面板写入并被看到
-- after_physics 也可以留空或仅用于后续映射
function after_physics()
    -- 此处可以 later map fold_ratio -> sim/flightmodel2/wing/airfoil_dihedral_increase_deg[index]
end
