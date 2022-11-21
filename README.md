# How to change the month header format in the Flutter Calendar

This example demonstrates how to change the month header format in the Flutter Calendar.

## Customizing the month header 

By using the headerDateFormat property, you can modify the month header format in the Flutter Event Calendar. In this sample, Using the onViewChanged callback, the different header formats are assigned based on the calendar views.

```

void viewChanged(ViewChangedDetails viewChangedDetails) {
  if (_controller.view == CalendarView.day) {
    _headerFormat = 'yyy MMM';
  } else if (_controller.view == CalendarView.week ||
      _controller.view == CalendarView.workWeek ||
      _controller.view == CalendarView.timelineDay ||
      _controller.view == CalendarView.timelineMonth) {
    _headerFormat = 'MMM yyy';
  } else if (_controller.view == CalendarView.month) {
    _headerFormat = 'MMMM yy';
  } else if (_controller.view == CalendarView.timelineWeek ||
      _controller.view == CalendarView.timelineWorkWeek) {
    _headerFormat = 'MMM yy';
  } else {
    _headerFormat = 'yyy';
  }
  SchedulerBinding.instance.addPostFrameCallback((timeStamp) {
    setState(() {

    });
  });
}

```

## Requirements to run the demo
* [VS Code](https://code.visualstudio.com/download)
* [Flutter SDK v1.22+](https://flutter.dev/docs/development/tools/sdk/overview)
* [For more development tools](https://flutter.dev/docs/development/tools/devtools/overview)

## How to run this application
To run this application, you need to first clone or download the ‘create a flutter maps widget in 10 minutes’ repository and open it in your preferred IDE. Then, build and run your project to view the output.

## Further help
For more help, check the [Syncfusion Flutter documentation](https://help.syncfusion.com/flutter/introduction/overview),
 [Flutter documentation](https://flutter.dev/docs/get-started/install).