# Table View Demo
This should help students get up to speed on using a table view for the first time.

## Required Files
You can make your own files if you wish but in an effort to speed this along, here are the files you'll need:

- [Images](https://github.com/Sirusblk/CS411SampleCode/tree/master/TableViewDemo/TableViewDemo/Images)
- [Model](https://github.com/Sirusblk/CS411SampleCode/tree/master/TableViewDemo/TableViewDemo/Models)


## Instructions
Create a new project. Make sure it's a `Single View Application`. Delete the initial view and it's corresponding view controller file.

In the `Object Library`, select `Table View Controller` and drag it to your storyboard.

We're going to skip making a View Controller for now and instead rely on making a view. We'll customize our prototype cell.

Increase the prototype cell's height to 90. Drag a `UIImage` and two `Labels` into the prototype cell. Arrange them so they look similar to the image below:

![UIImage and two Labels](https://raw.githubusercontent.com/Sirusblk/CS411SampleCode/master/TableViewDemo/img/pic01.png)

You may wish to change the second label's font to `Caption` so it diferentiates itself from first.

Create a new `Cocoa Touch Class` file. Name it whatever you'd like, I named mine Demo. Change the subclass to `UITableViewCell`. Your name will be updated to append this to your name. Uncheck the option to create a XIB file and make sure that you language is set to Swift.

Go to the Storyboard, click on the Assistant Editor. In the Document Outline select the Content View inside the Cell. On the right side, you can select your custom TableViewCell we created in the last step. `Ctrl` click and drag each of the labels and the UIImageView from the left, dragging them to your custom Cocoa Class on the right.

Exit the assistant editor going back to the Standard Editor and select the TableViewCell in the Storyboard (using the Document Outline works best). Set the Identifier in the Attributes Inspector to your custom UITableViewCell name. For instance I named mine `DemoTableViewCell` after the `DemoTableViewCell.swift` file I made previously. Click on the Identity inspector and do the same for the Class.

At this point you may want to use my model and preset images. Make sure they're inside your project folder. If you wish to use your own, make sure you create your model now.

Add your images in. You can either link in the raw `.png` files or add them to the `Assets`.

Alright now it's time to setup the view controller. Again create a new Cocoa Class. This time it'll be subclassing a `UITableViewController`.

Make an array to store our list of items. Use `var` to make it mutable so we can add and remove items to the array. With my model this is the line of code:

```swift
var demoItems = [SampleItem]()
```

When our view loads, we want to load up the data in this array. Make a private function called `loadSampleData` with no arguments. This will load up our array with data. Call this function from the existing function `viewDidLoad()`. Set the name, description, and image for each entry. I created 3. Append these to your array from the last step.

Our UITableViewController has a few default function implementations we need to overwrite.

For the function `numberOfSections()` return 1.

For the `tableView() -> Int` function, return the array count.

For the last function we need to mess with, `tableView() -> UITableViewCell` we need a bit of code. We're going to first identify the cells in which we want to modify. We'll deque them from the table, set the properties (remember the UIImage and Labels defined in our view file), then finally return this cell.

```swift
// This should match our cell's identifier in our Main.storyboard
let cellIdentifier = "DemoTableViewCell"

// Because we're using a custom cell class, we need to downcast the cell to our custom cell
guard let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as? DemoTableViewCell else {
    fatalError("Dequeued cell is not our custom DemoTableViewCell")
}

// Matches the correct data to the correct table cell
let demoItem = demoItems[indexPath.row]

cell.nameLabel.text = demoItem.name
cell.descLabel.text = demoItem.desc
cell.photoImageView.image = demoItem.img

return cell
```

Your code may differ slightly due to your naming.

Run your project and see if the table view display correctly.

You might notice that the table collides with the top of the screen include the time and notifications. We can solve that. In the Storyboard, select the View Controller and select `Editor > Embed In > Navigation Controller`. You may also wish to give your view a title in that new top bar.

If you did things right, you should see something similar to below:

![Finalized Table View](https://raw.githubusercontent.com/Sirusblk/CS411SampleCode/master/TableViewDemo/img/pic02.png)

## Troubleshooting
Make sure the outlets linked in your View are the appropriate types. They should be `UILabel` and `UIImageView`, not `UIView`!
