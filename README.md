# README

## Basic Functionality

* The user comes to the home page, sees a variety of software and can navigate through different product pages which inform the user about the product and give them the call-to-action to download that software for either Mac and/or Windows. The user's OS is detected and the appropriate version of the software is set to download from the CTA button.

* 'Downloads' page where all of the products that are on the site are listed as links.

* 'About' page

## Code Overview

* Ruby on Rails framework

#### Software Download

* On CTA button click, the appropriate version of the software for the user's OS is downloaded. (It is said directly on the button which OS version of the software will be downloaded.) The alternative version is downloadable from the link below the button.
* The OS variable can be controlled by setting params[:os] to be either 'mac' or 'windows'
* When a user is referred to the landing page from a Google ad, the software is wrapped in an Ironsource bundle using the FullyHosted class found in lib/fully_hosted.rb . For testing, append gclid to the url to mimmick a user with a Google click ID
* By default the user downloads the software from the cdn. If the params[:gclid] is present then, instead, the software is wrapped in an Ironsource bundle using the FullyHosted module in lib/fully_hosted.rb . On Mac the installer simply prompts the user to install the software. On Windows the user goes through multiple pages of offers to install other software first before being prompted to download the original software.
* To set parameters for the software package including software name and url edit the injection_params object. This is injected into the options object which is injected into the Ironsource bundle, along with a fallback url.

#### CDN

* Software downloadable on this site is accessible on AWS S3 buckets in downloadape > awoolo
