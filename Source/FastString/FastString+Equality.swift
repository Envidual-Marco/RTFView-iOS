// Copyright (c) 2016 Johannes Schriewer.
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
//   http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.

func ==(lhs: FastString, rhs: FastString) -> Bool {
	if lhs.byteCount != rhs.byteCount {
		return false
	}
	for i in 0..<lhs.byteCount {
		if lhs.buffer[i] != rhs.buffer[i] {
			return false
		}
	}
	return true
}

func ==(lhs: FastString, rhs: String) -> Bool {
	if lhs.byteCount != rhs.utf8.count {
		return false
	}
	var index = rhs.utf8.startIndex
	for i in 0..<lhs.byteCount {
		if lhs.buffer[i] != rhs.utf8[index] {
			return false
		}
		index = rhs.utf8.index(index, offsetBy: 1)
	}
	return true
}

