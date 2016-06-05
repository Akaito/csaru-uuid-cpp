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
};

} // namespace CSaruUuid

