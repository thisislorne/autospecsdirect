# README

## Basic Functionality

* The user comes to the home page, sees a variety of software and can navigate through different product pages which inform the user about the product and give them the call-to-action to download that software for either Mac and/or Windows. The user's OS is detected and the appropriate version of the software is set to download from the CTA button.

* 'Downloads' page where all of the products that are on the site are listed as links.

* 'About' page

## Code Overview

* Ruby on Rails framework

#### Software Download

* On CTA button click, the appropriate version of the software is downloaded for the user. (It is said directly on the button which OS version of the software will be downloaded.) The alternative version is downloadable from the link below the button.
* The OS variable can be controlled by setting params[:os] to be either 'mac' or 'windows'
* By default the user downloads the software from the cdn. If the params[:gclid] is present then, instead, an installer is downloaded. 
