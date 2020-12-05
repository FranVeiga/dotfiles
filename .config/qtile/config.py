# Copyright (c) 2010 Aldo Cortesi
# Copyright (c) 2010, 2014 dequis
# Copyright (c) 2012 Randall Ma
# Copyright (c) 2012-2014 Tycho Andersen
# Copyright (c) 2012 Craig Barnes
# Copyright (c) 2013 horsik
# Copyright (c) 2013 Tao Sauvage
#
# Permission is hereby granted, free of charge, to any person obtaining a copy
# of this software and associated documentation files (the "Software"), to deal
# in the Software without restriction, including without limitation the rights
# to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
# copies of the Software, and to permit persons to whom the Software is
# furnished to do so, subject to the following conditions:
#
# The above copyright notice and this permission notice shall be included in
# all copies or substantial portions of the Software.
#
# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
# IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
# FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
# AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
# LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
# OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
# SOFTWARE.

import os, subprocess
from typing import List  # noqa: F401

from libqtile import bar, layout, widget, dgroups, hook, extension
from libqtile.config import Click, Drag, Group, Key, Screen
from libqtile.lazy import lazy
from libqtile.utils import guess_terminal

mod = "mod4"
terminal = "alacritty"
browser = "vivaldi-snapshot"
scripts_path = "/home/franveiga/scripts/"

colors = [
        ["#202115", "#202115"], # 0 background
        ["#F92672", "#F92672"], # 1 even widgets
        ["#2a8ea1", "#2a8ea1"], # 2 odd widgets
        ["#A6E22E", "#A6E22E"], # 3 selected group
        ["#FD971F", "#FD971F"], # 4 window title foreground
        ["#f8f8f2", "#f8f8f2"], # 5 foreground
        ["#4d4d4b", "#4d4d4b"], # 5 foreground
        ]


@hook.subscribe.startup_once
def autostart():
    startup_script = os.path.expanduser("~/.config/qtile/autostart.sh")
    subprocess.call([startup_script])



keys = [


    ## LAYOUT AND WINDOW MANAGEMENT BINDINGS ##

    # Switch between windows in current stack pane
    Key([mod], "k", lazy.layout.previous(),
        desc="Move focus up in stack pane"),
    Key([mod], "j", lazy.layout.next(),
        desc="Move focus down in stack pane"),

    # Increase or decrease the master-slave ratio
    Key([mod], "l", lazy.layout.grow_main(),
        desc="Increase the size of the master window"),
    Key([mod], "h", lazy.layout.shrink_main(),
        desc="Decrease the size of the master window"),

    # Increase or decrease slave window size
    Key([mod, "shift"], "l", lazy.layout.grow(),
        desc="Increase the size of the master window"),
    Key([mod, "shift"], "h", lazy.layout.shrink(),
        desc="Decrease the size of the master window"),

    # Move windows up or down in current stack
    Key([mod, "shift"], "k", lazy.layout.shuffle_up(),
        desc="Move window up in current stack "),
    Key([mod, "shift"], "j", lazy.layout.shuffle_down(),
        desc="Move window down in current stack "),

    # Normalize windows
    Key([mod, "shift"], "n", lazy.layout.normalize(),
        desc="Normalize all windows"),

    # Switch window focus to other pane(s) of stack
    Key([mod], "space", lazy.layout.maximize(),
        desc="Toggle between maximum and minimum size of a slave window"),

    # Swap panes of split stack
    Key([mod, "shift"], "space", lazy.layout.flip(),
        desc="Flip master and slave sides"),

    # Toggle floating
    Key([mod, "shift"], "f", lazy.window.toggle_floating(),
        desc="Toggle the floating property on a window"),

    # Toggle fullscreen mode
    Key([mod, "shift"], "m", lazy.window.toggle_fullscreen(),
        desc="Toggle fullscreen for the focused window."),

    # Toggle between split and unsplit sides of stack.
    # Split = all windows displayed
    # Unsplit = 1 window displayed, like Max layout, but still with
    # multiple stack panes
    Key([mod], "Return", lazy.layout.swap_left(),
        desc="Swap window between master and slave"),




    Key([mod, "shift"], "Return", lazy.spawn(terminal),
        desc="Launch terminal"),



    # Toggle betqeen different layouts as defined below
    Key([mod], "Tab", lazy.next_layout(), desc="Toggle between layouts"),
    Key([mod], "q", lazy.window.kill(), desc="Kill focused window"),

    Key([mod, "shift"], "r", lazy.restart(), desc="Restart qtile"),
    Key([mod, "shift"], "q", lazy.spawn(scripts_path + "dmenu_qtile_logout"), desc="Shutdown qtile using dmenu"),
    Key([mod, "shift", "control"], "q", lazy.shutdown(), desc="Shutdown qtile"),



    Key([mod], "p", lazy.spawn(f"dmenu_run -nb {colors[0][0]} -sb {colors[4][0]} -sf {colors[0][0]}"),
        desc="Spawn a command using dmenu"),




    # XF86 key shortcuts
    Key([], "XF86AudioRaiseVolume", lazy.spawn("amixer set Master 5%+"), desc="Raise volume"),
    Key([], "XF86AudioLowerVolume", lazy.spawn("amixer set Master 5%-"), desc= "Lower volume"),
    Key([], "XF86AudioMute", lazy.spawn("amixer set Master toggle"), desc= "Mute volume"),


    Key([], "XF86AudioPlay", lazy.spawn("playerctl play-pause"), desc= "Play/Pause media"),
    Key([], "XF86AudioNext", lazy.spawn("playerctl next"), desc= "Skip media"),
    Key([], "XF86AudioPrev", lazy.spawn("playerctl previous"), desc= "Previous media"),

    Key([mod], "XF86AudioPlay", lazy.spawn("mocp -G &"), desc= "(mocp) Play/Pause media"),
    Key([mod], "XF86AudioNext", lazy.spawn("mocp -f &"), desc= "(mocp) Skip media"),
    Key([mod], "XF86AudioPrev", lazy.spawn("mcop -p &"), desc= "(mocp) Previous media"),


    Key([], "XF86MonBrightnessUp", lazy.spawn("xbacklight -inc 10"), desc= "Increase brightness"),
    Key([], "XF86MonBrightnessDown", lazy.spawn("xbacklight -dec 10"), desc= "Decrease Brightness"),

    Key([], "Print", lazy.spawn("flameshot gui"), desc= "Launch screenshot tool"),

    # Brightness up and down (my os doesn't recognize my brightness keys)
    Key([mod, "shift"], "x", lazy.spawn("xbacklight -inc 10"), desc= "Increase brightness"),
    Key([mod, "shift"], "z", lazy.spawn("xbacklight -dec 10"), desc= "Decrease Brightness"),




    # My program shortcuts
    Key([mod],          "u", lazy.spawn(browser),                    desc="Open browser"),
    Key([mod, "shift"], "u", lazy.spawn("qutebrowser"),              desc="Open lowbrowser"),
    Key([mod, "shift"], "e", lazy.spawn("pcmanfm"),                  desc="Open file explorer"),
    Key([mod],          "a", lazy.spawn("pavucontrol"),              desc="Open pavucontrol"),
    Key([mod, "shift"], "a", lazy.spawn(f"{terminal} -e alsamixer"), desc="Open alsamixer"),
    Key([mod],          "m", lazy.spawn(f"{terminal} -e mocp"),      desc="Open mocp"),
    Key([mod, "shift"], "p", lazy.spawn(f"{terminal} -e htop"),      desc="Open htop"),
    


    # Dmenu shortcuts
    Key([mod, "shift"], "s", lazy.spawn(scripts_path + "dmenu_shutdown"), desc="Shutdown using dmenu")
]


# groups = [Group(i) for i in "12345678"]

# for i in groups:
#     keys.extend([
#         # mod1 + letter of group = switch to group
#         Key([mod], i.name, lazy.group[i.name].toscreen(),
#             desc="Switch to group {}".format(i.name)),
#
#         # mod1 + shift + letter of group = switch to & move focused window to group
#         Key([mod, "shift"], i.name, lazy.window.togroup(i.name, switch_group=True),
#             desc="Switch to & move focused window to group {}".format(i.name)),
#         # Or, use below if you prefer not to switch to that group.
#         # # mod1 + shift + letter of group = move focused window to group
#         # Key([mod, "shift"], i.name, lazy.window.togroup(i.name),
#         #     desc="move focused window to group {}".format(i.name)),
#     ])

# MY GROUPS (designed to be more flexible)

# group_names = ["1", "2", "3", "4", "5", "6", "7", "8", "9"]
group_names = [" ", " ", " ", " ", " ", " ", " ", " ", " "]

groups = [Group(i, layout="tall") for i in group_names]


dgroups_key_binder = dgroups.simple_key_binder(mod)
dgroups_app_rules = []  # type: List


# #272822 0
# #F92672 1
# #66D9EF 2
# #A6E22E 3
# #FD971F 4
# #f8f8f2 5
# #4d4d4b 6


layout_defaults = {
        "border_normal" : colors[0][0],
        "border_focus" : colors[2][0],
        "border_width" : 2,
        "margin" : 6,
        "single_border_width" : 0,
        "single_margin" : 2
        }

layouts = [
    layout.Max(),
    # layout.Stack(num_stacks=2),
    # Try more layouts by unleashing below layouts.
    # layout.Bsp(),
    # layout.Columns(),
    # layout.Matrix(),

    layout.MonadTall(**layout_defaults, name="tall"),

    # layout.MonadWide(),
    # layout.RatioTile(),
    # layout.Tile(),
    # layout.TreeTab(),
    # layout.VerticalTile(),
    # layout.Zoomy(),
    layout.Floating(**layout_defaults)
]

widget_defaults = dict(
    font='Ubuntu Mono',
    fontsize=12,
    padding=3,
    background=colors[0],
    foreground=colors[5]
)
extension_defaults = widget_defaults.copy()

screens = [
    Screen(
        top=bar.Bar(
            [
                widget.GroupBox(hide_unused=False,
                                font='UbuntuMono Nerd Font',
                                fontsize=15,
                                highlight_color=colors[4],
                                highlight_method="block",
                                this_current_screen_border=colors[4],
                                block_highlight_text_color=colors[0],
                                active=colors[5],
                                inactive=colors[6],
                                rounded=False,
                                borderwidth=2,
                                padding_x=3,
                                padding_y=10,
                                margin_y=3),

                widget.CurrentLayout(background=colors[3],
                                     foreground=colors[0]),


                # widget.WindowTabs(separator="  |  "),
                widget.TaskList(
                    border = colors[4],
                    borderwidth = 0,
                    highlight_method = "block",
                    margin = 0,
                    padding = 3,
                    icon_size = 14,
                    markup_focused = "<span foreground='#202115'>{}</span>",
                    markup_minimized = "<span foreground='#4d4d4b'><i>{}</i></span>",
                    max_title_width = 140 
                    ),


                widget.TextBox(
                        text='',
                        background = colors[0],
                        foreground = colors[1],
                        padding=0,
                        fontsize=37),

 
                widget.Moc(
                        background = colors[1],
                        fmt = '<b>{}</b>',
                        noplay_color = colors[5],
                        play_color = colors[3],
                        max_chars=25
                        ),


                widget.TextBox(
                        text='',
                        background = colors[1],
                        foreground = colors[2],
                        padding=0,
                        fontsize=37),

                widget.TextBox(text="墳",
                               background=colors[2]),

                widget.Volume(volume_up_command="amixer set Master 5%+",
                              volume_down_command="amixer set Master 5%-",
                              background=colors[2],
                              mouse_callbacks = {
                                  "Button1" : lazy.spawn("/bin/sh -c amixer set Master 5%+"),
                                  "Button3" : lazy.spawn("/bin/sh -c amixer set Master 5%-")
                                  }),

                 widget.TextBox(
                        text='',
                        background = colors[2],
                        foreground = colors[1],
                        padding=0,
                        fontsize=37),

                widget.Memory(format=" {MemUsed}Mb/{MemTotal}Mb",
                              background = colors[1]),

                  widget.TextBox(
                        text='',
                        background = colors[1],
                        foreground = colors[2],
                        padding=0,
                        fontsize=37),

                widget.CPU(format=" {load_percent}%",
                           background = colors[2]),

                  widget.TextBox(
                        text='',
                        background = colors[2],
                        foreground = colors[1],
                        padding=0,
                        fontsize=37),


                widget.Battery(charge_char="",
                               discharge_char="",
                               format="{char} {percent:2.0%}",
                               update_interval=10,
                               background = colors[1],
                               notify_below=0.15),

                   widget.TextBox(
                        text='',
                        background = colors[1],
                        foreground = colors[2],
                        padding=0,
                        fontsize=37),

                widget.Clock(format=' %d/%m',
                             background = colors[2]),


                   widget.TextBox(
                        text='',
                        background = colors[2],
                        foreground = colors[1],
                        padding=0,
                        fontsize=37),


                widget.Clock(format=' %I:%M %p',
                             background = colors[1]),


                   widget.TextBox(
                        text='',
                        background = colors[1],
                        foreground = colors[2],
                        padding=0,
                        fontsize=37),


                widget.Systray(background = colors[2],
                               margin = 5),

                widget.TextBox(text=" ", background = colors[2])
            ],
            20,
        ),
    ),
]

# Drag floating layouts.
mouse = [
    Drag([mod], "Button1", lazy.window.set_position_floating(),
         start=lazy.window.get_position()),
    Drag([mod], "Button3", lazy.window.set_size_floating(),
         start=lazy.window.get_size()),
    Click([mod], "Button2", lazy.window.bring_to_front())
]

main = None  # WARNING: this is deprecated and will be removed soon
follow_mouse_focus = True
bring_front_click = False
cursor_warp = False
floating_layout = layout.Floating(float_rules=[
    # Run the utility of `xprop` to see the wm class and name of an X client.
    {'wmclass': 'confirm'},
    {'wmclass': 'dialog'},
    {'wmclass': 'download'},
    {'wmclass': 'error'},
    {'wmclass': 'file_progress'},
    {'wmclass': 'notification'},
    {'wmclass': 'splash'},
    {'wmclass': 'toolbar'},
    {'wmclass': 'confirmreset'},  # gitk
    {'wmclass': 'makebranch'},  # gitk
    {'wmclass': 'maketag'},  # gitk
    {'wname': 'branchdialog'},  # gitk
    {'wname': 'pinentry'},  # GPG key password entry
    {'wmclass': 'ssh-askpass'},  # ssh-askpass
])
auto_fullscreen = True
focus_on_window_activation = "smart"

# XXX: Gasp! We're lying here. In fact, nobody really uses or cares about this
# string besides java UI toolkits; you can see several discussions on the
# mailing lists, GitHub issues, and other WM documentation that suggest setting
# this string if your java app doesn't work correctly. We may as well just lie
# and say that we're a working one by default.
#
# We choose LG3D to maximize irony: it is a 3D non-reparenting WM written in
# java that happens to be on java's whitelist.
wmname = "LG3D"
