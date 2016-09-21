vim-colorscheme-template
========================

A template (and a script that generates the template) for creating Vim color
schemes that work on 16-color terminals, 256-color terminals, and GUIs.

The template includes predefined variables for all 16-color combinations and
individual 256-colors.

You define your base color scheme in terms of the 16-color combinations.

Then you override individual settings for 256-color terminals using the
256-color variables.

Then you override individual settings for GUI Vim using hex RGB settings.

The logic built in to the template applies the appropriate settings depending on
what terminal/gui Vim is running in.

