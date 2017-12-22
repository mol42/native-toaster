
# react-native-native-toaster

## Getting started

`$ npm install react-native-native-toaster --save`

### Mostly automatic installation

`$ react-native link react-native-native-toaster`

### Manual installation


#### iOS

1. In XCode, in the project navigator, right click `Libraries` ➜ `Add Files to [your project's name]`
2. Go to `node_modules` ➜ `react-native-native-toaster` and add `RNNativeToaster.xcodeproj`
3. In XCode, in the project navigator, select your project. Add `libRNNativeToaster.a` to your project's `Build Phases` ➜ `Link Binary With Libraries`
4. Run your project (`Cmd+R`)<

#### Android

1. Open up `android/app/src/main/java/[...]/MainActivity.java`
  - Add `import com.reactlibrary.RNNativeToasterPackage;` to the imports at the top of the file
  - Add `new RNNativeToasterPackage()` to the list returned by the `getPackages()` method
2. Append the following lines to `android/settings.gradle`:
  	```
  	include ':react-native-native-toaster'
  	project(':react-native-native-toaster').projectDir = new File(rootProject.projectDir, 	'../node_modules/react-native-native-toaster/android')
  	```
3. Insert the following lines inside the dependencies block in `android/app/build.gradle`:
  	```
      compile project(':react-native-native-toaster')
  	```

#### Windows
[Read it! :D](https://github.com/ReactWindows/react-native)

1. In Visual Studio add the `RNNativeToaster.sln` in `node_modules/react-native-native-toaster/windows/RNNativeToaster.sln` folder to their solution, reference from their app.
2. Open up your `MainPage.cs` app
  - Add `using Native.Toaster.RNNativeToaster;` to the usings at the top of the file
  - Add `new RNNativeToasterPackage()` to the `List<IReactPackage>` returned by the `Packages` method


## Usage
```javascript
import RNNativeToaster from 'react-native-native-toaster';

// TODO: What to do with the module?
RNNativeToaster;
```
  