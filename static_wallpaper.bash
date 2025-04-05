#!/usr/bin/env bash

# 配置壁纸目录（改成你自己的壁纸路径）
WALLPAPER_DIR="$HOME/wallpaper"

# 支持的图片格式（可根据需要添加）
IMAGE_EXTS=("jpg" "jpeg" "png" "webp" "gif")

# 获取所有图片文件的列表
mapfile -d $'\0' wallpapers < <(find "$WALLPAPER_DIR" -type f \( \
    $(printf -- "-iname *.%s -o " "${IMAGE_EXTS[@]}") -false \) -print0)

# 检查是否找到壁纸文件
if [[ ${#wallpapers[@]} -eq 0 ]]; then
    echo "错误：在 $WALLPAPER_DIR 中未找到任何壁纸文件！" >&2
    exit 1
fi

# 使用shuf随机选择一个壁纸
random_wallpaper=$(printf "%s\n" "${wallpapers[@]}" | shuf -n 1)

# 设置过渡效果参数（可根据需要调整）
TRANSITION_TYPE="any"      # 过渡类型（any、simple、wave、wipe、grow）
TRANSITION_DURATION=3      # 过渡持续时间（秒）
TRANSITION_FPS=144         # 动画帧率
TRANSITION_ANGLE=30        # 过渡角度（某些类型需要）
TRANSITION_STEP=1         # 过渡步长（某些类型需要）

# 设置新壁纸
swww img "$random_wallpaper" \
    --transition-type "$TRANSITION_TYPE" \
    --transition-duration "$TRANSITION_DURATION" \
    --transition-fps "$TRANSITION_FPS" \
    --transition-angle "$TRANSITION_ANGLE" \
    --transition-step "$TRANSITION_STEP"

# 可选：发送通知（需要安装notify-send）
notify-send -a "swww" "壁纸已更换" "当前壁纸: $(basename "$random_wallpaper")" -i "$random_wallpaper"
