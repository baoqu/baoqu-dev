#!/bin/bash

tmux -2 new-session -d -s baoqu

tmux new-window -t baoqu:1 -n 'front'
tmux select-window -t baoqu:1
tmux send-keys -t baoqu 'cd app-front' C-m
tmux send-keys -t baoqu 'rlwrap lein figwheel' C-m

tmux new-window -t baoqu:2 -n 'core'
tmux select-window -t baoqu:2
tmux send-keys -t baoqu 'cd app-core' C-m
tmux send-keys -t baoqu 'lein srv' C-m

tmux rename-window -t baoqu:0 'layout'
tmux select-window -t baoqu:0
tmux send-keys -t baoqu 'cd app-front/layout' C-m
tmux send-keys -t baoqu 'npm install && gulp' C-m

tmux -2 attach-session -t baoqu
