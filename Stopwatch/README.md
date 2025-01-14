# Lab2: Stopwatch

---
For this part of the lab, we will now focus on creating our first actual iOS app: a stopwatch. At the end of this portion of the lab, you will have a working iOS stopwatch app that you can deploy onto your own iOS device (more on deployment later).

The final app should look as follows:



####image#####

Now to actually construct it : follow the instructions

Xcode Shortcuts cheat sheet : https://appletree.or.kr/quick_reference_cards/Apple-Mac-iOS/xcode-cheat-sheet.pdf

1. First, you will need to setup a new XCode project. To do this, open XCode, and then either navigate to File > New > Project or use the shift-command-N keyboard shortcut. From here, choose the App option and click Next on the bottom right. Set the Project Name to be Stopwatch, the Organization to anything you like, make sure the User Interface dropdown is set to Storyboard, and then click Next. You can uncheck the three options at the bottom if you wish, we will learn about them in the coming weeks.

/Users/devikurup/Desktop/Screenshot 2025-01-13 at 12.43.22 PM.png

2. XCode now opens a larger interface than you used for the Stopwatch. If you click on the files on the left, will open in the middle pane of the UI. Check out the contents of some of the files, including AppDelegate.swift and ViewController.swift, just skimming the files to get a sense of what they are about. 

3. Now, we will take a look at the Main.storyboard file, which is used to, in short, graphically manage elements on the iOS device's screen. 

Click the main canvas rectangle. Notice the options on the right side (also known as the Inspector Pane) for you to investigate. In the Inspector Pane, click the leftmost icon on the top bar (this should look like a folded piece of paper, this is the File Inspector option). Here, uncheck the 'Use Trait Variations' option. Confirm via the dialogue box that pops up.

/Users/devikurup/Desktop/Screenshot 2025-01-13 at 2.04.45 PM.png

4. Now we will add text. Click the '+' button in the top right of the window. You will see a modal pop up with a search bar at the top. Make sure you are searching the Objects library by selecting the leftmost of the three options immediately below the search bar (it should be a circle with a square in the middle). Now you can search for the "Label" object in the search bar. Drag the label from the results onto your storyboard.

Now, go back to the inspector pane and click the 5th icon which is also called the 'attribute inspector' in the inspector pane. Now, change the starting text to '00:00.0', the font color to blue, and the size to be reasonably large.

5. Now add two Button objects to the interface in the same manner you did with the Label in step 4. Set one to have a green background and have the label 'Start', and the other one to have a red background and have the label 'Stop'. At this point, your interface should look something like the one below:


Now, put this project into a Git repository from the command line and commit our progress so far.

