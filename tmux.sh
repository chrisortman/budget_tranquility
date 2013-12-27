#!/bin/sh
tmux new-session -d -s budget-tranquility

tmux new-window -t budget-tranquility:1 -n 'zsh'
tmux new-window -t budget-tranquility:2 -n 'vim' 'vim'
tmux new-window -t budget-tranquility:3 -n 'server' 'bundle exec rails server'
tmux new-window -t budget-tranquility:4 -n 'console' 'bundle exec rails db'

tmux select-window -t budget-tranquility:2
tmux -2 attach-session -t budget-tranquility
