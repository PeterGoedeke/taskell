## General
-	The home screen is just a list of the tasks as boxes.
-	[Tasks](##tasks) may have various properties.
-	Pressing the up and down arrows navigates you through the list.
-	Pressing the right arrow marks the currently selected task as completed in the way specified by the type of task and the attributes of the task.
-	Tasks marked as completed which have properties such that they will reappear can be viewed on the upcoming screen with the `u` hotkey.
-	Pressing `shift + right arrow` moves the currently selected task to the next day without marking it as completed.
-	Actions such as these may be undone with the `ctrl + z` hotkey.
-	`ctrl + f` will open a [search](##search) dialogue which allows you to filter the list of tasks.
-	`ctrl + s` will open a [sort](##sort) dialogue which allows you to define the way in which tasks are sorted.
-	Tasks may be either tasks or [category tasks](##category-tasks). Category tasks contain multiple other tasks and operate slightly differently from regular tasks.
## Tasks
-	Tasks are defined by a title and an (optional) description. These are human readable and aren’t used by the application, other than for filtering.
-	Tasks are created with the ‘n’ hotkey.
	-	If a task is created while the user has a category task selected, the new task will be placed within the category task.
-	Tasks are may be created with a due date.
	-	This due date may be specified as an absolute date string.
	-	Alternatively, it may be specified as a number which represents the number of days before the task is due (exclusive of the current day).
	-	Alternatively, a task may have no due date.
-	Exceeding the due date of a task without completing it moves the task upwards in the search order but does not have other impact.
-	Tasks may be created as recurring or non-recurring. Recurring tasks may only be created with a timespan and not with an absolute due date.
-	Tasks may be created with a repeat number, which specifies how many times the task must be completed before it is marked as completed within its due date / time span.
-	Alternatively, tasks may be created with a frequency number, which specifies how many times per day the task must be completed before it is marked as completed. Tasks with a frequency number will reappear once this constraint of times per day is no longer met.
	-	Frequency number is essentially more rigid than repeat number; the repeat number states that you should complete the given task a certain number of times within a time frame, whereas the frequency number also specifies the exact spacing of these completions.
	-	As an example, it is not possible to state that the user should complete a given task twice during the week at any time during the week using the frequency number, but it is with the repeat number.
-	Tasks may be created as a category task with the ctrl + n hotkey.
-	The behaviour of tasks with different combinations of the above properties is listed below:

| Recurring? | Repeat number? | Frequency? | Behaviour                                                                                                                                                                                                                                                      |
|------------|----------------|------------|----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| False      | False          | False      | Task always shows in the home screen. When the task is marked as completed, it is removed and does not reappear.                                                                                                                                               |
| True       | False          | False      | Task shows in the home screen until completed. It then reappears once the timespan of the task has elapsed; this includes the time taken to complete the task, not just the time after it is completed.                                                        |
| False      | True           | Invalid    | Task shows in the home screen until completed for the given number of times. It is then removed and does not reappear.                                                                                                                                         |
| True       | True           | Invalid    | Task shows in the home screen until completed for the given number of times. It then reappears in the same way as a recurring task with no repeat number reappears.                                                                                            |
| False      | Invalid        | True       | Task shows in the home screen while the frequency constraint has not been met. Task reappears once enough time has passed that the frequency constraint has not been met. Task is removed permanently when the constraint is met, and the due date is reached. |
| True       | Invalid        | True       | Same as previous, but the task is never removed. This is the only property configuration which does not allow for a due date / time span.                                                                                                                      |

**Note:** whether the task has a due date (for non-recurring tasks) / timespan (for recurring tasks, mandatory) or not does not impact the behaviour of the task. There is no behaviour if the due date is exceeded and due date is used only for the purpose of sorting in the home screen.
## History / log
-	When a task is completed this is added to a log of all completed tasks and their completion dates.
	-	When a recurring task is completed, it is also added to the log; however, it is not removed from the list of active tasks.
-	The log can be viewed with the ‘h’ hotkey. It may also be searched. It is sorted by completion date, most recent to least recent.
## Search
## Sort
-	The default sorting order is to sort tasks which are due soonest at the top of the list. Ties are broken by having tasks which have a longer overall timespan earlier than those with a later overall timespan, and finally by having recurring tasks later than non-recurring tasks.
-	When a sorting order is defined, it is persistent after the sorting dialogue is closed.
-	Sorting orders may be created with the hotkey ctrl + shift + number and loaded with the hotkey ctrl + alt + number.
-	Empty categories are always at the very bottom of the sorting order.
## Category tasks
-	Category tasks are not completable tasks themselves, but instead contain other tasks.
-	Category tasks do not have a description but do have a title.
-	If a due date is set for a category task, it is an indication that all tasks within the category task should ideally be completed by the due date.
-	Tasks within a category task no longer have a due date, a recurring status, or a frequency number; the category task defines the behaviour for its children.
-	The repeat number of a task within a category task indicates how many times it can be completed before it is removed from the category task. Completing a child task with a repeat number does not move the child task to upcoming, it simply counts towards the repeat number of the parent.
-	A child task can be set to be permanent, which means that completing it does not remove the child task from the parent, it simply counts towards the repeat number of the parent.
-	The repeat number of a category task indicates how many of its sub-tasks must be completed by the due date of the category task.
-	The frequency number of a category task indicates the exact pacing at which its sub-tasks must be completed (e.g. one per day).
