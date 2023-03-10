extension GetByKeyIndex on Map<dynamic, dynamic> {
  elementAt(int index) => this.values.elementAt(index);
  keyAt(int index) => this.keys.elementAt(index);
}
