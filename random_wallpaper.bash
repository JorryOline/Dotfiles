#!/bin/bash
notify-send "Misson Complete！"
# 配置区
VIDEO_DIR="$HOME/wallpaper/video/wallpaper/"  # 视频目录
SCREEN="HDMI-A-1"                       # 显示器名称（xrandr查看）
LOOP_INFINITE=true                  # 是否无限循环单个视频

while true; do
    # 生成随机文件列表（处理特殊字符）
    mapfile -d $'\0' VIDEOS < <(find "$VIDEO_DIR" -type f \( -name "*.mp4" -o -name "*.mkv" -o -name "*.webm" \) -print0 | shuf -z)
    
    for video in "${VIDEOS[@]}"; do
        # 杀死旧进程
        killall mpvpaper 2>/dev/null
        
        # 构建参数
        OPTIONS="no-audio"
        $LOOP_INFINITE && OPTIONS+=" loop"
        
        # 启动新实例
        mpvpaper -o "$OPTIONS" "$SCREEN" "$video" &
        
        # 等待播放结束（如果是非循环模式）
        if ! $LOOP_INFINITE; then
            wait $(pidof mpvpaper)
        else
            # 循环模式下持续运行直到手动停止
            while pidof mpvpaper >/dev/null; do
                sleep 10
            done
        fi
    done
done


