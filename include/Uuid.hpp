#pragma once

#include <cstdint>

namespace CSaruUuid {

struct Uuid {
	union {
		uint64_t parts[2];
		struct {
			uint32_t high;
			uint32_t low;
		};
	};


	bool operator< (const Uuid & rhs) const {
		if (high < rhs.high)
			return true;
		if (low < rhs.low)
			return true;
		return false;
	}
};

} // namespace CSaruUuid

