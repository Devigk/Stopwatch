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

/Users/devikurup/Desktop/Screenshot 2025-01-14 at 12.25.24 PM.png

6. Now, put this project into a Git repository from the command line and commit our progress so far.

7. XCode features handy iOS simulators which we can use to test our app without deployment. In the upper-left of the XCode UI is a Play Button (>) that will build the project and run it on a simulator. By default, XCode will build this project to an iPhone 16 Pro simulator, but this can be changed by clicking 'iPhone 16 Pro' nearby in the top left corner. Run the build and see it works on the simulator (aside from the buttons working as expected, but we will fix that next).

8. Now we are going to have to create functions which will be called upon clicking the 'Start' and 'Stop' buttons. These actions are written in the 'ViewController.swift' file. 

Go there and add the following functions or connect the buttons to 'ViewController.swift' by holding the control key and drag the buttons one by one (no need connect manually when you drag the UI elements):


            @IBAction func startButtonTapped(sender: UIButton) {
              // code to start the clock
            }

            @IBAction func stopButtonTapped(sender: UIButton) {
              // code to stop the clock
            }

9.Now in the storyboard, it's time to "wire up" each button to its respective action. To do this, click on a button while holding the control key and drag the cursor to the View Controller as seen in the image below. When you release, the popup that you see in the image should appear and just select the action you want associated with the button. Verify that this was done correctly by looking at the Connections Inspector (last icon on the right in the rightmost Inspector Pane) and seeing the connection of each button to their respective actions.

/Users/devikurup/Desktop/Screenshot 2025-01-14 at 1.44.16 PM.png

10. We now need an Outlet variable for the time display. Add this line to the top of the ViewController class or connect the label to 'ViewController.swift' by holding the control key and drag the label to the top of the ViewController class (for this option you don't need to connect manually as given below)
    
            @IBOutlet weak var elapsedTimeLabel: UILabel!

Now connect the outlet by selecting our time display label while holding the control key. A series of options pops up. Under Referencing Outlets there is a suboption for New Referencing Outlet and there is an open circle at the end of the option. Holding the control key, click and drag that circle to the View Controller under the View Controller Scene to the left of the storyboard. When you let go, you should get a option for the outlet we added, elapsedTimeLabel; select that option. Again, the Connections Inspector should verify the connection was properly made.

11. We can save and build the project right now, but unfortunately our actions are pretty much useless and serving as just a placeholder right now. To make them more useful, we need a model that will handle the logic of finding the current time, calculating the elapsed time and converting that time into a string can be displayed through our outlet onto the time display label. Add a new Swift file called 'Stopwatch.swift' and add the following code to create a basic framework for our model:

            import Foundation

            class Stopwatch {
              
              private var startTime: NSDate

              func start() {

              }

              func stop() {

              }
            }
    
12. ** Playground (File -> New -> Playground) - (not required to create inside the current project)**
 
    Before we write the code for this model, let's experiment with dates and times in Swift using a playground. (Playgrounds are great places for us to experiment with Swift code) Open a new playground and call it something like 'DatePlayground'. Once it is open, add the following:

            import Foundation

            let startTime: NSDate = NSDate()
            
            
        /Users/devikurup/Desktop/Screenshot 2025-01-14 at 2.20.58 PM.png
        
   We see that when we create a new instance of NSDate, it defaults to the current datetime as shown in the figure. To create an older date is a little more effort, unfortunately, but it will give us a chance to play with NSCalendar. Let's create two more dates in our playground with the following code:
   
            let calendar = NSCalendar.current

            var newYearsDayComponents = DateComponents()
            newYearsDayComponents.year = 2015
            newYearsDayComponents.month = 1
            newYearsDayComponents.day = 1
            let newYearsDay = calendar.date(from: newYearsDayComponents)!

            var valentinesDayComponents = DateComponents()
            valentinesDayComponents.year = 2015
            valentinesDayComponents.month = 2
            valentinesDayComponents.day = 14
            valentinesDayComponents.hour = 9  // start the day at 9am for now
            let valentinesDay = calendar.date(from: valentinesDayComponents)!
            
We can find the difference between these dates using the timeIntervalSinceDate method:
   
            let diffVD2NYD = valentinesDay.timeIntervalSince(newYearsDay)
            let diffNYD2VD = newYearsDay.timeIntervalSince(valentinesDay)
   
            
What this is giving us is the time between these as seconds. In the case of diffNYD2VD the value is negative because when I subtract a larger number (Valentines Day) from a smaller number (New Years Day) it is negative, but that is easy to correct by multiplying by -1 if needed. What if I wanted the number of days between these dates? And what if after I wanted the number of hours that remained between them (since one starts at midnight and the other at 9am)? We could do the following:
   
            let diffDays = Int(diffVD2NYD / 86400)
            let diffHours = Int((diffVD2NYD.truncatingRemainder(dividingBy: 86400))/(3600))

To combine these into a string (that I might send to update a view, for example) all we need to do is the following:

            let diffVD2NYDAsString: String = String(format: "%02d:%02d", diffDays, diffHours)
            
Likewise, we can easily find the time that has elapsed from startTime and now with the following:

            var elapsedTime = startTime.timeIntervalSinceNow

************* End of Plaground *****************************

           
13. Having played with dates and times in the playground, let's return to the model and start filling it out. Replace the start and stop functions with the following:

            func start() {
              startTime = NSDate()
            }

            func stop() {
              startTime = nil
            }
