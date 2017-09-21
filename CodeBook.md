An explanation of the data and the processing done in this project:

Data was collected from 30 volunteers performing 6 different tasks while wearing a smartphone. The following data was colleted about their movements.

	features.txt: Names of the 561 features.
	activity_labels.txt: Names and IDs for each of the 6 activities.
	X_train.txt: 7352 observations of the 561 features, for 21 of the 30 volunteers.
	subject_train.txt: A vector of 7352 integers, denoting the ID of the volunteer in X_train.txt.
	y_train.txt: A vector of 7352 integers, denoting the ID of the activity in X_train.txt.
	X_test.txt: 2947 observations of the 561 features, for 9 of the 30 volunteers.
	subject_test.txt: A vector of 2947 integers, denoting the ID of the volunteer in X_test.txt.
	y_test.txt: A vector of 2947 integers, denoting the ID of the activity in X_test.txt.

Analysis Steps

First all data was placed into data drames.

Then names for each of the columns were added.

I then combined the training sets and test sets into a single data set.

Any columns that did not contain "mean()" or "std()" were removed from the set

The activity column was converted from a integer to a factor, using labels describing the activities.

I then created a tidy data set containing the mean for each feature.

Since each subject contains 6 rows in the tidy data set, we have 180 rows for 30 subject. 

The tidy data can be observed in tidy.csv
