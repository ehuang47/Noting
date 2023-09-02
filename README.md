<h1 align="center">
<!-- <sub>
<img  src="images/gman.png" height="38" width="38">
</sub> -->
Noting
</h1>

> A UIKit-based iOS App for creating, organizing, and storing simple notes locally on their device.
> Built to showcase my fundamental understanding of Swift, MVVM architecture, delegation principles, communication via NotificationCenter, CoreData, File System, custom UIViews and UIViewControllers.

*Note: (no pun intended) This is only tested with the Simulator, I don't own an iPhone.*

- [Technologies](#technologies)
- [Features](#features)
- [Bugs & Issues](#bugs--issues)
- [To-Do](#to-do)

## Technologies

- XCode 14.3.1
- Swift 5.5
- UIKit, Foundation, etc.

## Features

As of 06/06/2023, this project is on-hold. Not sure when I'll return to it.

- Can only programmatically populate and load data from CoreData on app startup.

## Bugs & Issues

- IB: doesn’t show the option to configure dynamic prototype cells
    - Guess ill try just rendering the table view, programmatically create the cells

## To-Do

- Create reusable nib for the section with folder + label and functionality of adding new ones
- Switch “label” entity to “group”, which can encompass archived/starred/ etc and labels.
    - Extra attribute: default or label
    - Main diff: notes can only be in 1 folder, but many groups 
    - Alternative: create my ReusableTableViewCell protocol, must have image + icon + icon color + countable etc.
